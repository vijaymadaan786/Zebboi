class ItemModel {
  ItemModel({
    this.name,
    this.itemname,
    this.itemgroup,
    this.rate,
    this.image,
    this.tag,
  });

  ItemModel.fromJson(dynamic json) {
    itemname = json['item_name'];
    name = json['name'];
    itemgroup = json['item_group'];
    rate = json['standard_rate'];
    image = json['image'];
    tag = json['_user_tags'];
  }
  String? itemname;
  String? name;
  String? itemgroup;
  // Float? rate;
  double? rate;
  String? image;
  String? tag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_name'] = itemname;
    map['name'] = name;
    map['item_group'] = itemgroup;
    map['standard_rate'] = rate;
    map['image'] = image;
    map['_user_tags'] = tag;
    return map;
  }
}
