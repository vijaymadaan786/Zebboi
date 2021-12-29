import 'dart:convert';
import 'package:ehay/constants/api_path.dart';
import 'package:http/http.dart' as http;

class DataService {
  DataService._();
  static final DataService _instance = DataService._();
  static DataService get instance => _instance;
  // late final Box box;

  // late Box box;
  //List data = DataController().productData;
  List data = [];

  // Future<dynamic> openBox() async {
  //   var dir = await getApplicationDocumentsDirectory();
  //   Hive.init(dir.path);
  //   box = await Hive.openBox('data');
  //   return;
  // }

  // Future putData(data) async {
  //   await box.clear();
  //   for (var d in data) {
  //     box.add(d);
  //   }
  // }

  Future<dynamic> getAllProduct() async {
    // openBox();
    String url = baseUrl + productUrl;
    Uri uri = Uri.parse(url);
    final header = {
      "Authorization": "token 0c9f4602e6a6f17:fcdd8001cb61c47",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    try {
      http.Response response = await http.get(uri, headers: header);

      if (response.statusCode == 200) {
        dynamic _jsonDecode = jsonDecode(response.body)["data"];
        return {
          "data": _jsonDecode,
          "hasError": false,
          "error": null,
          "code": response.statusCode
        };
      }
      // await putData(_jsonDecode);
      // print(_jsonDecode);
      return {
        "data": response.body,
        "hasError": true,
        "error": null,
        "code": response.statusCode
      };
    } catch (e) {
      // print('no Internet');
      return {"data": null, "hasError": true, "error": e};
    }
  }

  Future<dynamic> getTags() async {
    String url = baseUrl + tagPath;
    Uri uri = Uri.parse(url);
    final header = {
      "Authorization": "token 0c9f4602e6a6f17:fcdd8001cb61c47",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    try {
      http.Response response = await http.get(uri, headers: header);

      if (response.statusCode == 200) {
        dynamic _jsonDecode = jsonDecode(response.body)["data"];
        return {
          "data": _jsonDecode,
          "hasError": false,
          "error": null,
          "code": response.statusCode
        };
      }
      return {
        "data": response.body,
        "hasError": true,
        "error": null,
        "code": response.statusCode
      };
    } catch (e) {
      return {"data": null, "hasError": true, "error": e};
    }
  }

  Future<dynamic> getCategory() async {
    String url = baseUrl + categoryPath;
    Uri uri = Uri.parse(url);
    final header = {
      "Authorization": "token 0c9f4602e6a6f17:fcdd8001cb61c47",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    try {
      http.Response response = await http.get(uri, headers: header);

      if (response.statusCode == 200) {
        dynamic _jsonDecode = jsonDecode(response.body)["data"];
        return {
          "data": _jsonDecode,
          "hasError": false,
          "error": null,
          "code": response.statusCode
        };
      }
      return {
        "data": response.body,
        "hasError": true,
        "error": null,
        "code": response.statusCode
      };
    } catch (e) {
      return {"data": null, "hasError": true, "error": e};
    }
  }

  Future<dynamic> getBin() async {
    String url = baseUrl + binPath;
    Uri uri = Uri.parse(url);
    final header = {
      "Authorization": "token 0c9f4602e6a6f17:fcdd8001cb61c47",
      "Content-Type": "application/json",
      "Accept": "application/json"
    };
    try {
      http.Response response = await http.get(uri, headers: header);

      if (response.statusCode == 200) {
        dynamic _jsonDecode = jsonDecode(response.body)["data"];
        return {
          "data": _jsonDecode,
          "hasError": false,
          "error": null,
          "code": response.statusCode
        };
      }
      return {
        "data": response.body,
        "hasError": true,
        "error": null,
        "code": response.statusCode
      };
    } catch (e) {
      return {"data": null, "hasError": true, "error": e};
    }
  }
}
