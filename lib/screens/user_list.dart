import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms/providers/auth_provider.dart';
import 'package:sms/screens/register.dart';
import 'package:sms/widgets/logout_button.dart';
import '../theme/color.dart';
import '../widgets/user_card.dart';
import '../providers/user_provider.dart';

class UserListScreen extends StatefulWidget {
  final String role;
  const UserListScreen({Key? key, required this.role}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      if (userProvider.getUsers(widget.role).isEmpty) {
        userProvider.fetchUsersByRole(widget.role);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final currentUser = Provider.of<AuthProvider>(context).user;
    final users = userProvider.getUsers(widget.role);
    final loading = userProvider.isLoading(widget.role);
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
        automaticallyImplyLeading: currentUser!.role != 'teacher',
        actions:
            currentUser.role == 'teacher'
                ? [
                  LogoutButton()
                ]
                : [],
      ),
      body:
          loading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  itemCount: users.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return UserCard(user: users[index]);
                  },
                ),
              ),
      floatingActionButton:
          widget.role == 'student' && currentUser.role == 'school-admin'
              ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                backgroundColor: AppColors.tintedBlack,
                child: const Icon(Icons.add, color: AppColors.white),
              )
              : null,
    );
  }
}
