import 'package:flutter/material.dart';
import 'package:lji/SERVIS API/service.dart';
import 'package:lji/SERVIS API/user.dart';

class HomePage01 extends StatefulWidget {
  const HomePage01({Key? key}) : super(key: key);

  @override
  State<HomePage01> createState() => _HomePage01State();
}

class _HomePage01State extends State<HomePage01> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() async {
    try {
      final result = await UserService.fetchUsers();
      setState(() {
        users = result;
      });
    } catch (e) {
      // Handle error
      print('Error fetching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get API statefull'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            child: ListTile(
              title: Text(user.username),
              subtitle: Text(user.email),
            ),
          );
        },
      ),
    );
  }
}
