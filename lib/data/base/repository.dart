import 'dart:convert';
import 'package:http/http.dart' as http;

class Repository {
  final String _baseUrl = 'https://api.example.com';

  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse('$_baseUrl/$url'));
    return json.decode(response.body);
  }

  Future<dynamic> post(String url, dynamic data) async {
    final response = await http.post(Uri.parse('$_baseUrl/$url'), body: data);
    return json.decode(response.body);
  }

  Future<dynamic> put(String url, dynamic data) async {
    final response = await http.put(Uri.parse('$_baseUrl/$url'), body: data);
    return json.decode(response.body);
  }

  Future<dynamic> delete(String url) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$url'));
    return json.decode(response.body);
  }

}