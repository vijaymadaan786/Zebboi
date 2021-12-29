import 'package:ehay/core/auth/auth_page.dart';
import 'package:ehay/module/view/assetsdownload/assets_download.dart';

import 'package:ehay/module/view/dealer/dealer.dart';
import 'package:ehay/module/view/dealer/dealerdetail.dart';
import 'package:ehay/module/view/home/home.dart';
import 'package:ehay/module/view/land.dart';
import 'package:ehay/module/view/order/order.dart';
import 'package:ehay/module/view/others/orderdetail.dart';

import 'package:ehay/module/view/others/about.dart';
import 'package:ehay/module/view/others/conditions.dart';
import 'package:ehay/module/view/product/components/search_item_page.dart';
import 'package:ehay/module/view/product/product.dart';

import 'package:ehay/module/view/splash.dart';
import 'package:ehay/module/view/wish/wish.dart';
import 'package:get/get.dart';

class AppRoute {
  AppRoute._();
  static final AppRoute _instance = AppRoute._();
  static AppRoute get instance => _instance;
  static const String splashPage = "/splash";
  static const String landPage = "/land";
  static const String loginPage = "/login";
  static const String homePage = "/home";
  static const String checkoutPage = "/checkout";
  static const String detailsPage = "/details";
  static const String productPage = "/product";
  static const String featuredPage = "/featured";
  static const String dealsPage = "/deals";
  static const String assetsDownloadPage = "/assets_download_page";

  static const String orderPage = "/order";
  static const String orderDetailPage = "/orderDetails";
  static const String aboutPage = "/about";
  static const String conditionPage = "/condition";
  static const String wishlistPage = "/wishlist";
  static const String searchPage = "/search_page";
  static const String dealerPage = "/dealer_page";
  static const String dealerDetailPage = "/dealer_detail_page";
  static const String homeCategory = "/best_seller";

  static List<GetPage> getPage = [
    GetPage(name: splashPage, page: () => const Splash()),
    GetPage(name: assetsDownloadPage, page: () => const AssetDownload()),
    GetPage(name: landPage, page: () => const LandPage()),
    GetPage(name: loginPage, page: () => const LoginPage()),
    GetPage(name: homePage, page: () => const HomePage()),
    GetPage(name: orderPage, page: () => const OrderPage()),
    GetPage(name: productPage, page: () => const ProductPage()),
    GetPage(name: aboutPage, page: () => const AboutPage()),
    GetPage(name: conditionPage, page: () => const ConditionPage()),
    GetPage(name: wishlistPage, page: () => const WishPage()),
    GetPage(
        name: searchPage,
        page: () => const SearchCategoryItems(
              itemGroup: '',
            )),
    GetPage(name: dealerPage, page: () => const DealerPage()),
    GetPage(name: dealerDetailPage, page: () => const DealerDetailsPage()),
    GetPage(name: orderDetailPage, page: () => const OrderDetail(itemName: '')),
  ];
}
