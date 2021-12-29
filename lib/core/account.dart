import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/assets_path.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/core/auth/auth_page.dart';
import 'package:ehay/module/controller/auth_controller.dart';
import 'package:ehay/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find();

    return Obx(() {
      if (auth.isUserExists.value) {
        return const UserProfile();
      } else {
        return const LoginPage();
      }
    });
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //AuthServices service = Get.find();
    AuthController auth = Get.find();
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Column(
          children: [
            getVerticalSpace(40),
            Image.asset(userProfile, width: 80),
            getVerticalSpace(20),
            Text(
              //  "Dealer Test",

              // AuthServices.login!['name'],
              auth.data['full_name'] ?? '',
              style: GoogleFonts.rubik(
                fontSize: getTextSize(24),
                fontWeight: FontWeight.w700,
                color: kDark,
              ),
            ),
            Text(
              //  "Dealer Test",

              // AuthServices.login!['name'],
              auth.data['userid'] ?? '',
              style: GoogleFonts.rubik(
                fontSize: getTextSize(16),
                // fontWeight: FontWeight.w700,
                color: Colors.blueGrey,
              ),
            ),
            getVerticalSpace(5),
            const Divider(),
            getVerticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Phone",
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kLightText,
                  ),
                ),
                Text(
                  auth.data['phone'] ?? '',
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kDark,
                  ),
                ),
              ],
            ),
            getVerticalSpace(15),
            const Divider(),
            getVerticalSpace(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Address",
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kLightText,
                  ),
                ),
                Text(
                  (auth.data['shipping_address'] != null)
                      ? auth.data['shipping_address']!['name'] ?? ''
                      : '',
                  // auth.data['shipping_address']!['name'] ?? '-',
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kDark,
                  ),
                ),
                Text(
                  (auth.data['shipping_address'] != null)
                      ? auth.data['shipping_address']!['address_line1'] ?? ''
                      : '',
                  // auth.data!['shipping_address']!['address_line1'] ?? '-',
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kDark,
                  ),
                ),
                Text(
                  (auth.data['shipping_address'] != null)
                      ? auth.data['shipping_address']!['address_line2'] ?? ''
                      : '',
                  // auth.data['shipping_address']!['address_line2'] ?? '-',
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kDark,
                  ),
                ),
                Text(
                  (auth.data['shipping_address'] != null)
                      ? auth.data['shipping_address']!['city'] ?? ''
                      : '',
                  // auth.data['shipping_address']!['city'] ?? '-',
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kDark,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      (auth.data['shipping_address'] != null)
                          ? auth.data['shipping_address']!['state'] ?? ''
                          : '',
                      // auth.data['shipping_address']!['state'] ?? '-',
                      style: GoogleFonts.rubik(
                        fontSize: getTextSize(14),
                        fontWeight: FontWeight.w500,
                        color: kDark,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      (auth.data['shipping_address'] != null)
                          ? auth.data['shipping_address']!['zip'] ?? ''
                          : '',
                      // auth.data['shipping_address']!['country'] ?? '-',
                      style: GoogleFonts.rubik(
                        fontSize: getTextSize(14),
                        fontWeight: FontWeight.w500,
                        color: kDark,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      (auth.data['shipping_address'] != null)
                          ? auth.data['shipping_address']!['country'] ?? ''
                          : '',
                      // auth.data['shipping_address']!['pincode'] ?? '-',
                      style: GoogleFonts.rubik(
                        fontSize: getTextSize(14),
                        fontWeight: FontWeight.w500,
                        color: kDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            getVerticalSpace(15),
            const Divider(),
            getVerticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Customer ID",
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kLightText,
                  ),
                ),
                Text(
                  auth.data['customer'] ?? '-',
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(14),
                    fontWeight: FontWeight.w500,
                    color: kDark,
                  ),
                ),
              ],
            ),
            getVerticalSpace(15),
            const Divider(),
            getVerticalSpace(15),
            CustomButton(
              text: "Sign Out",
              press: () {
                auth.logOut();
              },
            ),
          ],
        )
      ],
    );
  }
}
