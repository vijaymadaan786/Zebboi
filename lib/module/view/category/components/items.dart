import 'package:cached_network_image/cached_network_image.dart';
import 'package:ehay/constants/api_path.dart';
import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/model/category.dart';
import 'package:ehay/utils/helper/lazy_loader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.item, this.title})
      : super(key: key);
  final Category item;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(100),
      width: getScreeWidth(345),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        // image: DecorationImage(
        //   image: NetworkImage(
        //     item.image![0].toString().startsWith("/file")
        //         ? baseUrl + item.image![0].toString()
        //         : item.image![0].toString(),
        //   ),
        // ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "Category",
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(12),
                    fontWeight: FontWeight.w400,
                    color: kRed,
                  ),
                ),
                getVerticalSpace(8),
                Text(
                  item.name.toString(),
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(18),
                    fontWeight: FontWeight.w500,
                    color: kDark,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 100,
                height: 100,
                memCacheHeight: 600,
                memCacheWidth: 600,
                // imageUrl:
                // "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
                imageUrl: item.image![0].toString().startsWith("/file")
                    ? baseUrl + item.image![0].toString()
                    : item.image![0].toString(),
                placeholder: (context, url) => const ShimmerLoader(),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/image_placeholder.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
