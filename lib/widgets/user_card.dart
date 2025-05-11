import 'package:flutter/material.dart';
import 'package:sms/theme/color.dart';
import '../models/user.dart';
import '../widgets/user_option_bottom_sheet.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    print(user.residence);
    return GestureDetector(
      onTap: () {
        // Replace this with your bottom sheet logic
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => UserOptionsBottomSheet(user: user),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: 
          user.role == 'school-admin' ? AppColors.yellow
          : user.role == 'teacher' ? AppColors.green
          : AppColors.orange
          ,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // CircleAvatar(radius: 30, backgroundImage: NetworkImage(user.image)),
            const SizedBox(height: 15),
            Text(
              user.name,
              style: const TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                user.role.toUpperCase(),
                style: const TextStyle(color: AppColors.tintedBlack, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "ID: #" + user.id.toString(),
              style: const TextStyle(color: AppColors.white, fontSize: 17),
            ),
            Text(
              "Age: " + user.age.toString(),
              style: const TextStyle(color: AppColors.white, fontSize: 17),
            ),
            Text(
              "Location: " + user.residence,
              style: const TextStyle(color: AppColors.white, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}