import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms/providers/auth_provider.dart';
import 'package:sms/screens/update_user.dart';
import 'package:sms/widgets/logout_button.dart';

import '../models/user.dart';
import '../theme/color.dart';

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<AuthProvider>(context).user;
    return Scaffold(
      backgroundColor: AppColors.tintedBg,
      appBar: AppBar(
        backgroundColor: AppColors.tintedBg,
        elevation: 0,
        title: const Text(
          'User Details',
          style: TextStyle(
            color: AppColors.tintedBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.tintedBlack),
        automaticallyImplyLeading: currentUser!.role != 'student',
        actions: currentUser.role == 'student' ? [LogoutButton()] : [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // CircleAvatar(radius: 50, backgroundImage: NetworkImage(user.image)),
            const SizedBox(height: 20),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.tintedBlack,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.tintedBlack, // Border color
                  width: 1.0, // Border width
                ),
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                user.role.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            buildInfoRow("User ID", user.id.toString()),
            buildInfoRow("Email", user.email),
            buildInfoRow("Age", user.age.toString()),
            buildInfoRow("Location", user.residence),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child:
                  currentUser.role == 'school-admin' ||
                          (currentUser.role == 'student' &&
                              currentUser.id == user.id)
                      ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.tintedBlack,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => UpdateUserScreen(user: user),
                              ),
                            ),
                        child: const Text(
                          'Update',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      )
                      : null,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child:
                  currentUser.role != 'student'
                      ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.tintedBlack,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Go Back',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      )
                      : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: AppColors.tintedBlack,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.tintedBlack,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
