//import 'dart:html';

import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/app_constants.dart';
import 'package:ehay/constants/assets_path.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/app_controller.dart';
import 'package:ehay/module/controller/auth_controller.dart';
import 'package:ehay/utils/helper/dialog.dart';
import 'package:ehay/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AppController appCtrl = Get.find();
  AuthController authCtrl = Get.find();

  final TextEditingController _numberCtrl = TextEditingController();
  final TextEditingController _otpCtrl = TextEditingController();

  bool getOtp = true;
  bool enabled = true;
  bool show = false;

  @override
  void dispose() {
    super.dispose();

    _numberCtrl.dispose();
    _otpCtrl.dispose();
  }

  @override
  void initState() {
    super.initState();
    // checkToken();
    EasyLoading.instance.backgroundColor = Colors.white;
  }

  void showDialog({required String errorMessage}) {
    Get.dialog(
      Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 220,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                  child: Column(
                    children: [
                      const Text(
                        'Alert !!!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        errorMessage,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          child: const Text("Okay"),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(kPrimary)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ],
                  ),
                ),
              ),
              const Positioned(
                  top: -40,
                  child: CircleAvatar(
                    backgroundColor: kPrimary,
                    radius: 40,
                    child: Icon(
                      Icons.error_outline_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  )),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        decoration: boxDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //  isSignIn = true;
                          changeState();
                        },
                        child: AnimatedContainer(
                          duration: 500.milliseconds,
                          curve: Curves.ease,
                          child: Text(
                            "Dealer Log In",
                            style: TextStyle(
                              fontSize: getTextSize(20),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // isSignIn = true; // change to false to show signup
                          changeState();
                        },
                        child: AnimatedContainer(
                          duration: 500.milliseconds,
                          curve: Curves.ease,
                          child: Text(
                            " ",
                            style: TextStyle(
                              fontSize: getTextSize(20),
                              //  color: !isSignIn ? Colors.white : kOffWhite,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  getVerticalSpace(60),
                  Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'We will send you an ',
                                style: TextStyle(color: Colors.white)),
                            TextSpan(
                                text: 'One Time Password ',
                                style: TextStyle(
                                    color: kPrimary,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: 'on this mobile number',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      )),
                  getVerticalSpace(20),
                  TextField(
                    enabled: enabled ? true : false,
                    keyboardType: TextInputType.number,
                    controller: _numberCtrl,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        hintText: "999-999-9999",
                        hintStyle: TextStyle(
                            color: kOffWhite, fontSize: getTextSize(20)),
                        enabledBorder: outlineInputBorder,
                        border: outlineInputBorder),
                  ),
                  getVerticalSpace(10),
                  show
                      ? TextField(
                          keyboardType: TextInputType.number,
                          controller: _otpCtrl,
                          style: const TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: null,
                              icon: SvgPicture.asset(
                                lockIcon,
                                color: Colors.white,
                              ),
                            ),
                            hintText: "Enter OTP",
                            hintStyle: TextStyle(
                                color: kOffWhite, fontSize: getTextSize(20)),
                            enabledBorder: outlineInputBorder,
                            border: outlineInputBorder,
                          ),
                        )
                      : const SizedBox(),
                  getVerticalSpace(20),
                  CustomButton(
                    text: getOtp ? 'Get OTP' : "Verify OTP",
                    press: () async {
                      if (getOtp) {
                        bool isValid = validateNumber();
                        if (isValid) {
                          debugPrint("Get Otp");
                          //sendOtp();
                          bool isSend = await fetchOtp();
                          if (isSend) {
                            setState(() {
                              getOtp = false;
                              enabled = false;
                              show = true;
                            });
                          }
                        }
                      } else {
                        debugPrint("Verify Otp");
                        verifyOtp(authCtrl.otp.value);
                      }
                    },
                  ),
                  getVerticalSpace(20),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  changeState() {
    if (mounted) setState(() {});
  }

  void verifyOtp(String serverOtp) async {
    final otp = _otpCtrl.text;

    if (otp.isNotEmpty) {
      try {
        EasyLoading.show(status: "Please wait");

        if (serverOtp == otp) {
          authCtrl.saveUserData();
          EasyLoading.showSuccess("Otp Verified");
          authCtrl.isUserExists(true);
        } else {
          showDialog(errorMessage: 'Invalid Otp Detected');
        }
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
        EasyLoading.dismiss();
      } finally {
        EasyLoading.dismiss();
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Field can't be empty")));
    }
  }

  bool validateNumber() {
    final number = _numberCtrl.text;

    if (number.isNotEmpty && number.length == 10) {
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter valid mobile number")));
      return false;
    }
  }

  Future<bool> fetchOtp() async {
    final number = _numberCtrl.text;
    try {
      EasyLoading.show(status: "Please wait");

      final result = await authCtrl.userLogin(phone: number);
      // return print(result);
      if (result['status'] == false) {
        // print(result['data']);

        showDialog(errorMessage: result['data']);
        EasyLoading.dismiss();
        return false;
      } else {
        EasyLoading.showSuccess("Otp Sent Successfully");
        // print(result["data"]);
        EasyLoading.dismiss();
        return true;
      }
    } catch (e) {
      EasyLoading.dismiss();
      return false;
    }
  }
}
