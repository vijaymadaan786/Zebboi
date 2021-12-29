import 'dart:convert';
import 'package:ehay/constants/api_path.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthServices extends GetxController {
  AuthServices._();
  static final AuthServices _instance = AuthServices._();
  static AuthServices get instance => _instance;

  static Map<String, String> login = <String, String>{};

  Future loginFromApi(String phone) async {
    String url = baseUrl + loginPath;
    final payload = {"phone": phone};

    final header = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(payload),
        headers: header,
      );

      Map<String, dynamic> responseResult = <String, dynamic>{};

      final responseData = jsonDecode(response.body);


      responseResult = {"code": response.statusCode, "data": responseData};

      return responseResult;
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    }
  }
}
