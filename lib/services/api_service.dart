import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Resource<T> {
  final String url;
  T Function(http.Response response) parse;

  Resource({required this.url, required this.parse});
}

class Api {
  post_(String url, {params, headers}) async {
    var header = headers ?? {'Content-Type': 'application/json'};

    if (kDebugMode) {
      print('POST url: $url');
    }

    final response = params == null
        ? await http.post(Uri.parse(url), headers: header)
        : await http.post(Uri.parse(url), body: params, headers: header);

    debugPrint(
        'Status Code: ${response.statusCode}\nPOST response: ${response.body}',
        wrapWidth: 1024);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['status'] == 'error') {
        throw getMeaningfulError(response);
      } else {
        return json;
      }
    } else {
      throw (getMeaningfulError(response));
    }
  }

  String getMeaningfulError(http.Response response) {
    var errorMsg = '';
    try {
      var jsonError = jsonDecode(response.body);
      if (jsonError is List) {
        for (var e in jsonError) {
          errorMsg += e['messege'] + '\n';
        }
        print('error: $errorMsg');
      } else {
        errorMsg = jsonError['messege'];
      }
    } catch (e) {
      errorMsg = '${response.statusCode}: ${response.body}';
    }

    return errorMsg;
  }
}
