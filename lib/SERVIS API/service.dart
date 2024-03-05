class User {
  final int id;
  final String username;
  final String email;
  final String password_v;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.password_v});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['email'],
        username: json['name'],
        password_v: json['password']);
  }
}
