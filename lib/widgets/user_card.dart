import 'package:flutter/material.dart';
import 'package:sms/theme/color.dart';
import '../models/user.dart';
import '../widgets/user_option_bottom_sheet.dart';

class UserCard extends StatelessWidget {
  final User user;
  final Color backgroundColor;

  const UserCard({
    super.key,
    required this.user,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
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
          color: backgroundColor,
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
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                user.role,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Text(
              "ID: " + user.id.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            // Text(
            //   "Location: " + user.location,
            //   style: const TextStyle(color: Colors.white),
            // ),
          ],
        ),
      ),
    );
  }
}

Widget buildSection(String title, List<User> userList, Color bgColor) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text("See All", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
      Expanded(
        // height: , // Increase height to accommodate two rows if needed
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: userList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards in one row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8, // Adjust this for card height
          ),
          itemBuilder: (context, index) {
            return UserCard(user: userList[index], backgroundColor: bgColor);
          },
        ),
      ),
    ],
  );
}
