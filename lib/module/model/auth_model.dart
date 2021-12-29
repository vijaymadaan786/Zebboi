class AuthModel {
  AuthModel({
    this.phone,
  });

  AuthModel.fromJson(dynamic json) {
    phone = json['phone'];
  }

  User? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (phone != null) {
      map['phone'] = phone?.toJson();
    }
    return map;
  }
}

class User {
  User({this.otp});
  User.fromJson(dynamic json) {
    otp = json['otp'];
  }
  // int? id;

  String? otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['otp'] = otp;

    return map;
  }
}

class Role {
  Role({
    // this.id,
    this.name,
    this.description,
    this.type,
  });

  Role.fromJson(dynamic json) {
    //  id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
  }
  // int? id;
  String? name;
  String? description;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    //   map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['type'] = type;
    return map;
  }
}
