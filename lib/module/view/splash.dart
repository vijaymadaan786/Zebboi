import 'package:ehay/config/routes/app_routes.dart';
import 'package:ehay/constants/assets_path.dart';
import 'package:ehay/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // authCtrl.init();
    Future.delayed(3.seconds).then(
      (value) => Get.offAndToNamed(
        AppRoute.assetsDownloadPage,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff274A80),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return OrientationBuilder(
            builder: (ctx, orientation) {
              ResponsiveSize.init(ctx, orientation);
              return Center(
                child: SvgPicture.asset(
                  splashLogo,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
