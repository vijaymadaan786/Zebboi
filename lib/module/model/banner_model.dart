class BannerModel {
  String? title;
  String? offerText;
  String? imgUrl;

  BannerModel({this.title, this.offerText, this.imgUrl});

  BannerModel.fromMap(Map<String, dynamic> map) {
    title = map['title']!;
    offerText = map['subtitle']!;
    imgUrl = map['imgUrl']!;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['title'] = title;
    map['subtitle'] = offerText;
    map['imgUrl'] = imgUrl;

    return map;
  }
}
