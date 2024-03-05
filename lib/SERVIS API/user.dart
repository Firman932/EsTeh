import 'dart:convert';
import 'package:lji/SERVIS API/service.dart';
import 'package:http/http.dart' as http;

class UserService {
  static const String baseUrl = 'https://pkl.hummatech.com/api';

  static Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/login-user'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        List<User> users = List<User>.from(body['data'].map(
          (user) => User.fromJson(user),
        ));
        return users;
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}
