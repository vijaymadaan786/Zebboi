import 'dart:io';

import 'package:ehay/module/model/bin.dart';
import 'package:ehay/module/model/category.dart';
import 'package:ehay/module/model/tag.dart';
import 'package:ehay/module/view/assetsdownload/helper.dart';
import 'package:ehay/utils/hive_utils.dart' as item_util;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class AssetDownload extends StatefulWidget {
  const AssetDownload({Key? key}) : super(key: key);

  @override
  State<AssetDownload> createState() => _AssetDownloadState();
}

class _AssetDownloadState extends State<AssetDownload> {
  String status = 'Loading items';
  bool loading = true;

  Future<bool> hasConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  void fetchItems() async {
    var categoryBox = await Hive.openBox<Category>('categories');
    var tagBox = await Hive.openBox<Tag>('tags');
    var binBox = await Hive.openBox<Bin>('bin');
    await item_util.clear();
    await categoryBox.clear();
    await tagBox.clear();
    await binBox.clear();
    dynamic result = await syncAllItems();
    setState(() {
      status = result['status'];
      loading = result['hasError'] == true ? false : true;
    });
    if (result['hasError']) return;
    setState(() => status = 'Loading tags');
    result = await syncAllTags();
    setState(() {
      status = result['status'];
      loading = result['hasError'] == true ? false : true;
    });
    if (result['hasError']) return;
    setState(() => status = 'Loading categories');
    result = await syncAllCategory();
    setState(() {
      status = result['status'];
      loading = result['hasError'] == true ? false : true;
    });
    if (result['hasError']) return;
    setState(() => status = 'Loading stocks');
    result = await syncBin();
    setState(() {
      status = result['status'];
      loading = result['hasError'] == true ? false : true;
    });
    if (result['hasError']) return;
    Navigator.popAndPushNamed(context, '/land');
  }

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(radius: loading ? 14 : 0.1),
            const Divider(
              color: Colors.transparent,
            ),
            Text(status, textAlign: TextAlign.center),
            const Divider(
              color: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
