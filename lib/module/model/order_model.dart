class Orders {
  Orders({
    this.name,
    this.itemcode,
    this.quantity,
    this.price,
  });

  Orders.fromJson(dynamic json) {
    name = json['name'];
    itemcode = json['item_code'];
    quantity = json['qty'];
    price = json['rate'];
  }
  String? name;
  String? itemcode;
  int? quantity;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['title'] = itemcode;
    map['quantity'] = quantity;
    map['price'] = price;
    return map;
  }
}
