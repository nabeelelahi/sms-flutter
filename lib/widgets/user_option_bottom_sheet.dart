import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms/models/user.dart';
import 'package:sms/providers/auth_provider.dart';
import 'package:sms/providers/user_provider.dart';
import 'package:sms/screens/update_user.dart';
import 'package:sms/screens/user_detail.dart';

class UserOptionsBottomSheet extends StatelessWidget {
  final User user;

  const UserOptionsBottomSheet({super.key, required this.user});

  _areYouSureDialog(onYes, context, title, content) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('Cancel'),
              ),
              ElevatedButton(onPressed: onYes, child: Text('Yes')),
            ],
          ),
    );
  }

  _updateRole(String role, context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Navigator.pop(context);
    _areYouSureDialog(
      () => userProvider.updateUserRole(user.id, role, user.role),
      context,
      'Are you sure?',
      'Are you sure you want to mark this student as a $role?',
    );
  }

  _deleteUser(context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Navigator.pop(context);
    _areYouSureDialog(
      () => userProvider.removeUser(user.id, user.role),
      context,
      'Are you sure?',
      'Are you sure you want to delete this user.?',
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<AuthProvider>(context).user;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("View"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsScreen(user: user),
                ),
              );
              // implement view logic
            },
          ),
          Column(
            children:
                currentUser!.role == 'school-admin'
                    ? [
                      Container(
                        child:
                            user.role != 'school-admin'
                                ? ListTile(
                                  leading: const Icon(
                                    Icons.admin_panel_settings_outlined,
                                  ),
                                  title: const Text("Make School Admin"),
                                  onTap:
                                      () =>
                                          _updateRole('school-admin', context),
                                )
                                : null,
                      ),
                      Container(
                        child:
                            user.role != 'teacher'
                                ? ListTile(
                                  leading: const Icon(Icons.upgrade_outlined),
                                  title: const Text("Make Teacher"),
                                  onTap: () => _updateRole('teacher', context),
                                )
                                : null,
                      ),
                      Container(
                        child:
                            user.role != 'student'
                                ? ListTile(
                                  leading: const Icon(Icons.cast_for_education),
                                  title: const Text("Make Student"),
                                  onTap: () => _updateRole('student', context),
                                )
                                : null,
                      ),
                      ListTile(
                        leading: const Icon(Icons.edit),
                        title: const Text("Edit"),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => UpdateUserScreen(user: user),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.delete_outline),
                        title: const Text("Delete"),
                        onTap: () => _deleteUser(context),
                      ),
                    ]
                    : [],
          ),
        ],
      ),
    );
  }
}
