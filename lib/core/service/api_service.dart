import 'dart:convert';
import 'dart:io';
import 'package:test_task/core/res/app_url.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var noInternetMessage = "Please check your connection!";

  static  getRequest() async {
     final response =await http.get(Uri.parse(AppUrl.memeApi));
    return response;
  }



  static handleResponse(http.Response response) async {
    try {
      if (response.statusCode >= 200 && response.statusCode <= 210) {
        print("SuccessCode ${response.statusCode}");
        print("SuccessBody ${response.body.toString()}");

        if (response.body.isNotEmpty) {
          return jsonDecode(response.body);
        } else {
          return response.body;
        }
      } else if (response.statusCode == 401) {
        String msg = "Unauthorized";
        if (response.body.isNotEmpty) {
          if (jsonDecode(response.body)['error'] != null) {
            msg = jsonDecode(response.body)['error'];
          }
        }
        throw msg;
      } else if (response.statusCode == 404) {
        throw "Page not found";
      } else if (response.statusCode == 500) {
        throw "server error";
      } else {
        print("Error Code :${response.statusCode}");
        print("Error Response :${response.body}");
        String msg = "something went wrong";
        // if (response.body.isNotEmpty) {
        //   var data = jsonDecode(response.body)['error'];
        //   if (data == null) {
        //     msg = jsonDecode(response.body)['message'] ?? msg;
        //   } else if (data is String) {
        //     msg = data;
        //   } else if (data is Map) {
        //     msg = data['email'][0];
        //   }
        // }
        throw msg;
      }
    } on SocketException catch (_) {
      throw noInternetMessage;
    } on FormatException catch (_) {
      throw "Bad Exception success";
    } catch (e) {
      throw e.toString();
    }
  }
}
