import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ehay/constants/api_path.dart';
import 'package:ehay/module/model/bin.dart';
import 'package:ehay/module/model/item.dart';
import 'package:ehay/module/view/details/components/review.dart';
import 'package:ehay/utils/helper/lazy_loader.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'components/header.dart';
import 'components/info.dart';

class DetailsPage extends StatefulWidget {
  final Item item;
  const DetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int activeIndicator = 0;
  double premiumStock = 0;
  double projectStock = 0;

  void setIndicator(int value) {
    setState(() {
      activeIndicator = value;
    });
  }

  fetchStock() async {
    var binBox = await Hive.openBox<Bin>('bin');
    var bin = binBox.values
        .where((element) => element.itemCode == widget.item.name)
        .toList();
    if (bin.isNotEmpty) {
      for (var element in bin) {
        if (element.binType == 'Premium') {
          setState(() {
            premiumStock += element.actualQty!;
          });
        } else {
          setState(() {
            projectStock += element.actualQty!;
          });
        }
      }
    }
  }

  @override
  void initState() {
    fetchStock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      //extendBody: true,
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Header(item: widget.item),
                  Expanded(
                    child: ListView(
                      children: [
                        Stack(
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                  height: 300.0,
                                  onPageChanged: (index, reason) {
                                    setIndicator(index);
                                  },
                                  enableInfiniteScroll: false,
                                  viewportFraction: 1),
                              items: widget.item.image?.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        width: double.maxFinite,
                                        height: double.maxFinite,
                                        memCacheHeight: 600,
                                        memCacheWidth: 600,
                                        imageUrl: widget
                                                .item
                                                .image![widget.item.image!
                                                    .indexOf(i)]
                                                .startsWith("/file")
                                            ? baseUrl +
                                                widget.item.image![widget
                                                    .item.image!
                                                    .indexOf(i)]
                                            : widget.item.image![
                                                widget.item.image!.indexOf(i)],
                                        placeholder: (context, url) =>
                                            const ShimmerLoader(),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                'assets/images/image_placeholder.jpg',
                                                fit: BoxFit.cover),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            widget.item.image!.length > 1
                                ? Positioned(
                                    bottom: 10,
                                    left: 0,
                                    right: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: widget.item.image?.map((url) {
                                            return Container(
                                              width: 8.0,
                                              height: 8.0,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 2.0),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: activeIndicator ==
                                                          widget.item.image!
                                                              .indexOf(url)
                                                      ? Colors.black
                                                      : Colors.grey),
                                            );
                                          }).toList() ??
                                          [],
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          // decoration: const BoxDecoration(
                          //     // color: Color(0xffF5F5F5),
                          //     // borderRadius: BorderRadius.vertical(
                          //     //   top: Radius.circular(30),
                          //     // ),
                          //     ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Info(
                                premiumStock: premiumStock,
                                projectStock: projectStock,
                                items: widget.item,
                              ),

                              Service(
                                  item: widget.item,
                                  premiumStock: premiumStock,
                                  projectStock: projectStock),
                              Description(item: widget.item),

                              //ReviewRating(item:item),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // bottomNavigationBar: const CartButton(),
    );
  }
}
