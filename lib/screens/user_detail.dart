import 'package:flutter/material.dart';

import '../models/user.dart'; // Replace with your actual model import
import '../theme/color.dart'; // Replace with your app colors

class UserDetailsScreen extends StatelessWidget {
  final User user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundImage: NetworkImage(user.image)),
            const SizedBox(height: 20),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.tintedBlack,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                user.role,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            buildInfoRow("User ID", user.id),
            buildInfoRow("Location", user.location),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
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
              ),
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
              color: AppColors.tintedBlack,
            ),
          ),
          Text(value, style: const TextStyle(color: AppColors.accent)),
        ],
      ),
    );
  }
}
