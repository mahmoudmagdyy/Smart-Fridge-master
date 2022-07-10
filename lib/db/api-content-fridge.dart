import 'package:login_signup_screen/model/content-fridge-model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Content>> fetchContent() async {
  final response =
  await http.get(Uri.parse('http://192.168.1.22:3000/api/v1/fridge'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Content>((json) => Content.fromMap(json)).toList();

  } else {
    throw Exception('Failed to load album');
  }
}
