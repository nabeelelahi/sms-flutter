import 'package:flutter/material.dart';
import 'package:sms/screens/update_user.dart';
import 'package:sms/screens/user_detail.dart';

class UserOptionsBottomSheet extends StatelessWidget {
  final dynamic user;

  const UserOptionsBottomSheet({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("View"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsScreen(user: user),
                ),
              );
              // implement view logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("Make School Admin"),
            onTap: () {
              Navigator.pop(context);
              // implement view logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("Make Teacher"),
            onTap: () {
              Navigator.pop(context);
              // implement view logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Edit"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateUserScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline),
            title: const Text("Delete"),
            onTap: () {
              // implement delete logic
            },
          ),
        ],
      ),
    );
  }
}
