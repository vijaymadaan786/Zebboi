import 'package:ehay/module/model/product_model.dart';

class MyOrderModel {
  MyOrderModel({
    this.id,
    this.product,
    this.status,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.payment,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.totalPrice,
    this.qty,
    this.usersPermissionsUser,
    this.products,
  });

  MyOrderModel.fromJson(dynamic json) {
    // id = json['id'];
    product = json['product'];
    status = json['status'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    payment = json['payment'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    totalPrice = json['totalPrice'];
    qty = json['qty'];
    // usersPermissionsUser = json['users_permissions_user'] != null
    //     ? UsersPermission.fromJson(json['usersPermissionsUser'])
    //     : null;
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductModel.fromJson(v));
      });
    }
  }
  int? id;
  dynamic product;
  String? status;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  String? payment;
  String? name;
  String? email;
  String? phone;
  String? address;
  int? totalPrice;
  dynamic qty;
  UsersPermission? usersPermissionsUser;
  List<ProductModel>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['id'] = id;
    map['product'] = product;
    map['status'] = status;
    map['published_at'] = publishedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['payment'] = payment;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['address'] = address;
    map['totalPrice'] = totalPrice;
    map['qty'] = qty;
    // if (usersPermissionsUser != null) {
    //   map['users_permissions_user'] = usersPermissionsUser?.toJson();
    // }
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class UsersPermission {
  UsersPermission({
    this.id,
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.avatar,
  });

  UsersPermission.fromJson(dynamic json) {
    // id = json['id'];
    username = json['username'];
    email = json['email'];
    provider = json['provider'];
    confirmed = json['confirmed'];
    blocked = json['blocked'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    avatar = json['avatar'];
  }
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  dynamic blocked;
  int? role;
  String? createdAt;
  String? updatedAt;
  dynamic avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['provider'] = provider;
    map['confirmed'] = confirmed;
    map['blocked'] = blocked;
    map['role'] = role;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['avatar'] = avatar;
    return map;
  }
}
