import 'auth_model.dart';

class CheckoutModel {
  CheckoutModel({
    this.customer,
    this.products,
    this.total,
    this.user,
  });

  CheckoutModel.fromJson(dynamic json) {
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartListItems.fromJson(v, v.quantity));
      });
    }
    total = json['total'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  Customer? customer;
  List<CartListItems>? products;
  double? total;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class Customer {
  Customer({
    this.fullname,
    this.email,
    this.address,
    this.phone,
  });

  Customer.fromJson(dynamic json) {
    fullname = json['fullname'];
    email = json['email'];
    address = json['address'];
    phone = json['phone'];
  }
  String? fullname;
  String? email;
  String? address;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullname'] = fullname;
    map['email'] = email;
    map['address'] = address;
    map['phone'] = phone;
    return map;
  }
}

// class CartListItems {
//   int? id;
//   String? title;
//   int? quantity;
//   String? productImage;
//   int? price;

//   CartListItems.fromJson(dynamic json, int qty) {
//     id = json['id'];
//     title = json['title'];
//     quantity = qty;
//     productImage = json['productDetailsImg'][0]["url"];
//     price = json['price'];
//   }

//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map['id'] = id;
//     map['title'] = title;
//     map['quantity'] = quantity;
//     map['productDetailsImg'] = productImage;
//     map['price'] = price;
//     return map;
//   }
// }
class CartListItems {
  String? name;
  String? title;
  int? quantity;
  String? productImage;
  double? price;

  CartListItems.fromJson(dynamic json, int qty) {
    name = json['name'];
    title = json['item_name'];
    quantity = qty;
    productImage = json['image'];
    price = json['standard_rate'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['item_name'] = title;
    map['quantity'] = quantity;
    map['image'] = productImage;
    map['standard_rate'] = price;
    return map;
  }
}
