class AuthErrorModel {
  AuthErrorModel({
    this.statusCode,
    this.message,
    this.data,
  });

  AuthErrorModel.fromJson(dynamic json) {
    statusCode = json['status'];

    if (json['message'] != null) {
      message = [];
      json['message'].forEach((v) {
        message?.add(Message.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? statusCode;
  String? error;
  List<Message>? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = statusCode;

    if (message != null) {
      map['message'] = message?.map((v) => v.toJson()).toList();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.messages,
  });

  Data.fromJson(dynamic json) {
    if (json['messages'] != null) {
      messages = [];
      json['messages'].forEach((v) {
        messages?.add(Messages.fromJson(v));
      });
    }
  }
  List<Messages>? messages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (messages != null) {
      map['messages'] = messages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Messages {
  Messages({
    this.id,
    this.message,
  });

  Messages.fromJson(dynamic json) {
    id = json['id'];
    message = json['message'];
  }
  String? id;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['message'] = message;
    return map;
  }
}

class Message {
  Message({
    this.messages,
  });

  Message.fromJson(dynamic json) {
    if (json['messages'] != null) {
      messages = [];
      json['messages'].forEach((v) {
        messages?.add(Messages.fromJson(v));
      });
    }
  }
  List<Messages>? messages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (messages != null) {
      map['messages'] = messages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
