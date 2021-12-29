class LoginModel {
  LoginModel({
    this.message,
    this.homepage,
    this.fullname,
  });

  LoginModel.fromJson(dynamic json) {
    message = json['message'];
    homepage = json['home_page'];
    fullname = json['full_name'];
  }
  String? message;
  String? homepage;
  String? fullname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['home_page'] = homepage;
    map['full_name'] = fullname;

    return map;
  }
}
