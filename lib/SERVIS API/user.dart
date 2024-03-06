import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  int? id;
  String? name;
  String? email;
  String? password; // Add password field

  User({this.id, this.name, this.email, this.password}); // Update constructor

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'], // Parse password from JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password, // Include password in JSON serialization
    };
  }
}

class UserService {
  static const String baseUrl = 'https://pkl.hummatech.com/api';

  static Future<List<User>> fetchUsersAndInsertToFirebase() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/login-user'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        List<User> users = List<User>.from(body['data'].map(
          (user) => User.fromJson(user),
        ));

        // Insert users to Firebase
        for (User user in users) {
          // Overread password here
          user.password = '*****'; // Replace with your obfuscation logic
          insertUserToFirebase(user.toJson());
        }

        return users;
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}

void insertUserToFirebase(Map<String, dynamic> userJson) {
  // Anda bisa menambahkan implementasi Firebase disini
  print('Menyimpan user ke Firebase: $userJson');
}

void main() async {
  try {
    List<User> users = await UserService.fetchUsersAndInsertToFirebase();
    print('Users inserted to Firebase: $users');
  } catch (e) {
    print('Error: $e');
  }
}
