import 'package:ehay/constants/api_path.dart';
import 'package:ehay/module/model/auth_error_model.dart';
import 'package:ehay/utils/services/api/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var authLoading = false.obs;
  var token = "".obs;
  var userId = "".obs;
  var errorMsg = "".obs;
  var authErrorModel = AuthErrorModel().obs;
  var isUserExists = false.obs;
  var otp = "".obs;
  var data = {}.obs;
  final box = GetStorage();

  /*<---------------------Login--------------------->*/

  @override
  void onInit() {
    if (box.read('token') != null) {
      data.value = box.read('user_data');
      isUserExists.value = true;
      update();
      checkTokenValidity(box.read('token'));
    }
    super.onInit();
  }

  void saveUserData() {
    box.write('token', data['token']);
    box.write('user_data', data);
  }

  void logOut() {
    isUserExists.value = false;
    data.value = {};
    otp.value = "";
    box.remove('token');
    box.remove('user_data');
    update();
  }

  void checkTokenValidity(token) async {
    try {
      http.Response response = await http.get(
          Uri.parse(baseUrl + checkLoginPath),
          headers: {'Authorization': 'token ' + token});
      if (response.statusCode != 200) {
        logOut();
      }
      // print(response.statusCode);
    } catch (e) {
      // print(e);
    }
  }

  Future<dynamic> userLogin({@required phone}) async {
    try {
      authLoading(true);
      final result = await AuthServices.instance.loginFromApi(phone);
      if (result['code'] == 200) {
        if (result['data']['message']['status'] == false) {
          return result['data']['message'];
        }
        otp.value = result['data']['message']['data']['otp'];
        data.value = result['data']['message']['data'];
        // ignore: avoid_print
        print(otp.value);
        update();
        return result['data']['message'];
      } else {
        authErrorModel.value = AuthErrorModel.fromJson(result['data']);
        update();
        return result['data']['message'];
      }
    } catch (e) {
      rethrow;
    } finally {
      authLoading(false);
    }
  }
}
