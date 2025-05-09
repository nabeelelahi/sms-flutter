import 'package:flutter/material.dart';
import 'package:sms/services/request_singleton.dart';
import 'package:sms/theme/color.dart';
import '../models/user.dart';
import '../widgets/user_card.dart';
import 'package:flutter/services.dart';

class UserListScreen extends StatefulWidget {
  final String role;
  const UserListScreen({Key? key, required this.role}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> users = [];

  Future<void> loadUsers() async {
    RequestSingleton<List<dynamic>>('/user/${widget.role}/role', 'GET')
        .onSuccess((data, headers) {
          print('Success : $data');
          setState(() {
            users = List<User>.from(data.map((x) => User.fromJson(x)));
          });
        })
        .onFailure((error) {
          print('failed: $error');
        })
        .call();
  }

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          widget.role == 'student'
              ? 'Students List'
              : widget.role == 'teacher'
              ? 'Teachers List'
              : 'School Admins',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
      // users['teachers']!.isEmpty
      // ? const Center(child: CircularProgressIndicator())
      // :
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: users.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return UserCard(
                user: users[index],
                backgroundColor: AppColors.accent,
              );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.tintedBlack,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
