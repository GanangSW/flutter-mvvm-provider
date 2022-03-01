import 'dart:io';

import 'package:flutter_mvvm_provider/models/cat_fact_model.dart';
import 'package:flutter_mvvm_provider/utils/api_status.dart';
import 'package:flutter_mvvm_provider/utils/constants.dart';
import 'package:http/http.dart' as http;

class CatFactServices {
  static Future<Object> getCatFact() async {
    try {
      var url = Uri.parse(BASE_URL);
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return Success(response: catFactModelFromJson(response.body));
      }
      return Failure(code: 100, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: 101, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: 102, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: 103, errorResponse: e.toString());
    }
  }
}
