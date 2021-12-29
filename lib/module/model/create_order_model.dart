// import 'auth_model.dart';
// import 'cart_model.dart';
//
// class CreateOrderModel {
//   CreateOrderModel({
//       this.products,});
//
//   CreateOrderModel.fromJson(dynamic json) {
//     products = json['products'] != null ? Products.fromJson(json['products']) : null;
//   }
//   Products? products;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (products != null) {
//       map['products'] = products?.toJson();
//     }
//     return map;
//   }
//
// }
//
// //
//
//
//
// // class Orders {
// //   Orders({
// //       this.id,
// //       this.title,
// //       this.quantity,
// //       this.price,});
// //
// //   Orders.fromJson(dynamic json) {
// //     id = json['id'];
// //     title = json['title'];
// //     quantity = json['quantity'];
// //     price = json['price'];
// //   }
// //   int? id;
// //   String? title;
// //   int? quantity;
// //   int? price;
// //
// //   Map<String, dynamic> toJson() {
// //     final map = <String, dynamic>{};
// //     map['id'] = id;
// //     map['title'] = title;
// //     map['quantity'] = quantity;
// //     map['price'] = price;
// //     return map;
// //   }
// //
// // }
//
// class Customer {
//   Customer({
//       this.fullname,
//       this.email,
//       this.address,
//       this.phone,});
//
//   Customer.fromJson(dynamic json) {
//     fullname = json['fullname'];
//     email = json['email'];
//     address = json['address'];
//     phone = json['phone'];
//   }
//   String? fullname;
//   String? email;
//   String? address;
//   String? phone;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['fullname'] = fullname;
//     map['email'] = email;
//     map['address'] = address;
//     map['phone'] = phone;
//     return map;
//   }
//
// }