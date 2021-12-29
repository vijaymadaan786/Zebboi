import 'package:ehay/constants/app_constants.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/model/item.dart';
import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  final Item? item;
  final double projectStock;
  final double premiumStock;

  const Service(
      {Key? key,
      this.item,
      required this.premiumStock,
      required this.projectStock})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String splitSize = item!.size ?? '0x0x0';
    var size = splitSize.split('x');

    final orientation = MediaQuery.of(context).orientation;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(color: Color(0x28334AFF), boxShadow: [
        BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 15,
          color: Color.fromRGBO(0, 0, 0, 0.05),
        )
      ]),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: ResponsiveSize.screenWidth * 0.5,
                child: Text(
                  "Color:",
                  style: descriptionText(),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "black",
                      style: infoText(),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: ResponsiveSize.screenWidth * 0.5,
                child: Text(
                  "Size:",
                  style: descriptionText(),
                ),
              ),
              Expanded(
                child: Text(
                  size[0] + "x" + size[1] + ' ' + 'mm',
                  style: infoText(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: ResponsiveSize.screenWidth * 0.5,
                child: Text(
                  "Thickness:",
                  style: descriptionText(),
                ),
              ),
              Expanded(
                child: Text(
                  size[2] + ' ' + 'mm',
                  style: infoText(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: ResponsiveSize.screenWidth * 0.5,
                child: Text(
                  "Premium Stock Quantity:",
                  style: descriptionText(),
                ),
              ),
              Expanded(
                child: Text(
                  premiumStock.toInt() == 0
                      ? 'Out of stock'
                      : premiumStock.toInt().toString() + ' ' + 'pieces',
                  style: infoText(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: ResponsiveSize.screenWidth * 0.5,
                child: Text(
                  "Project Stock Quantity:",
                  style: descriptionText(),
                ),
              ),
              Expanded(
                child: Text(
                  projectStock.toInt() == 0
                      ? 'Out of stock'
                      : projectStock.toInt().toString() + ' ' + 'pieces',
                  style: infoText(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: ResponsiveSize.screenWidth * 0.5,
                child: Text(
                  "Brand:",
                  style: descriptionText(),
                ),
              ),
              Expanded(
                child: Text(
                  item!.brand ?? '',
                  style: infoText(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Category:",
                style: descriptionText(),
              ),
              // ...List.generate(
              //     item!.category!.length,
              //     (index) => Chip(
              //           label: Text(item!.category![index]),
              //           backgroundColor: Colors.black12,
              //         )),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: item!.category!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 45,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 3 : 3),
                itemBuilder: (BuildContext context, int index) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Chip(
                      label: Text(item!.category![index]),
                      backgroundColor: Colors.black12,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  final Item? item;

  const Description({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 15,
          color: Color.fromRGBO(0, 0, 0, 0.05),
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: ResponsiveSize.screenWidth,
              child: Text(
                "Description:",
                style: descriptionText(),
              )),
          const Divider(),
          Text(item!.description ?? 'No Description provided'),
        ],
      ),
    );
  }
}

// class ReviewRatings extends StatelessWidget {
//   const ReviewRatings({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // DataController data = Get.find();
//     return Container(
//       margin: const EdgeInsets.only(top: 10),
//       padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//       decoration: const BoxDecoration(color: Colors.white, boxShadow: [
//         BoxShadow(
//           offset: Offset(0, 4),
//           blurRadius: 15,
//           color: Color.fromRGBO(0, 0, 0, 0.05),
//         )
//       ]),
//       child: Obx(() {
//         return Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Ratings & Reviews",
//                   style: descriptionText(),
//                 ),
//               ],
//             ),
//             const Divider(height: 25),
//             // getVerticalSpace(15),
//             if (data.productDetails.value.name!.isEmpty)
//               Center(
//                 child: Text(
//                   "No Review".capitalize!,
//                   style: Get.textTheme.caption,
//                 ),
//               ),
//             if (data.productDetails.value.name!.isNotEmpty)
//               ...List.generate(
//                 data.productDetails.value.name!.length,
//                 (index) => Column(
//                   children: [
//                     Row(
//                       children: [
//                         RichText(
//                           text: TextSpan(
//                             text:
//                                 // "${data.productDetails.value.reviews![index].name} - ",
//                                 "Tile",
//                             style: descriptionText(),
//                             children: [
//                               TextSpan(
//                                 text:
//                                     DateFormat.yMMMMd().format(DateTime.now()),
//                                 style: descriptionText(),
//                               )
//                             ],
//                           ),
//                         ),
//                         const Spacer(),
//                         // RatingBar.builder(
//                         //   initialRating: data

//                         //       // .productDetails.value.reviews![index].ratings!
//                         //       .productDetails
//                         //       .value
//                         //       .rate!
//                         //       .toDouble(),
//                         //   minRating: 1,
//                         //   direction: Axis.horizontal,
//                         //   allowHalfRating: true,
//                         //   unratedColor: kAppIcon,
//                         //   itemCount: 5,
//                         //   itemSize: 14,
//                         //   itemPadding:
//                         //       const EdgeInsets.symmetric(horizontal: 1.0),
//                         //   itemBuilder: (context, _) => const Icon(
//                         //     Icons.star,
//                         //     color: kStar,
//                         //   ),
//                         //   ignoreGestures: true,
//                         //   onRatingUpdate: (rating) => debugPrint("$rating"),
//                         // ),
//                       ],
//                     ),
//                     getVerticalSpace(10),
//                     Text(
//                       // data.productDetails.value.reviews![index].feedback!,
//                       data.productDetails.value.itemname![index],
//                       style: TextStyle(
//                         fontSize: getTextSize(12),
//                         fontWeight: FontWeight.w500,
//                         letterSpacing: 0.3,
//                         height: 1.8,
//                       ),
//                     ),
//                     // if (index + 1 < data.productDetails.value.reviews!.length)
//                     Divider(
//                       height: getScreenHeight(45),
//                     ),
//                   ],
//                 ),
//               )
//           ],
//         );
//       }),
//     );
//   }
// }
