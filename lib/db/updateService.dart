
import 'package:http/http.dart' as http;
import 'dart:convert';

class Update  {
  Future<http.Response> update(String name,String type,String image,String shelf,) {
    return http.post(
      Uri.parse('http://192.168.1.22:3000/api/v1/product/insert'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'type': type,
        'image': image,
        'shelf': shelf,
      }),

    );
  }

  }



