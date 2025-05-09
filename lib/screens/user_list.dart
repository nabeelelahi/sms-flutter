import 'package:flutter/material.dart';
import 'package:sms/theme/color.dart';
import '../models/user.dart';
import '../widgets/user_card.dart';
import 'package:flutter/services.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> users = [];

  Future<void> loadUsers() async {
    final List<Map<String, dynamic>> teachers = [
      {
        "name": "Dawoud Rabih",
        "role": "Teacher",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4UlS1Ehv87B7_HRdQWlKz8Jw13A0zxuiuQ&s",
      },
      {
        "name": "William",
        "role": "Teacher",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_B8cYF8ZVSmK8ey4GWZx3BSiDAEUDqR8kiLJjQsXjUV2865K8WVq5PYNSHoMpVWlTetU&usqp=CAU",
      },
      {
        "name": "Dawoud Rabih",
        "role": "Teacher",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4UlS1Ehv87B7_HRdQWlKz8Jw13A0zxuiuQ&s",
      },
      {
        "name": "William",
        "role": "Teacher",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_B8cYF8ZVSmK8ey4GWZx3BSiDAEUDqR8kiLJjQsXjUV2865K8WVq5PYNSHoMpVWlTetU&usqp=CAU",
      },
      {
        "name": "Dawoud Rabih",
        "role": "Teacher",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4UlS1Ehv87B7_HRdQWlKz8Jw13A0zxuiuQ&s",
      },
      {
        "name": "William",
        "role": "Teacher",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_B8cYF8ZVSmK8ey4GWZx3BSiDAEUDqR8kiLJjQsXjUV2865K8WVq5PYNSHoMpVWlTetU&usqp=CAU",
      },
      {
        "name": "Dawoud Rabih",
        "role": "Teacher",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4UlS1Ehv87B7_HRdQWlKz8Jw13A0zxuiuQ&s",
      },
      {
        "name": "William",
        "role": "Teacher",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_B8cYF8ZVSmK8ey4GWZx3BSiDAEUDqR8kiLJjQsXjUV2865K8WVq5PYNSHoMpVWlTetU&usqp=CAU",
      },
      {
        "name": "Dawoud Rabih",
        "role": "Teacher",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4UlS1Ehv87B7_HRdQWlKz8Jw13A0zxuiuQ&s",
      },
      {
        "name": "William",
        "role": "Teacher",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_B8cYF8ZVSmK8ey4GWZx3BSiDAEUDqR8kiLJjQsXjUV2865K8WVq5PYNSHoMpVWlTetU&usqp=CAU",
      },
      {
        "name": "Dawoud Rabih",
        "role": "Teacher",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4UlS1Ehv87B7_HRdQWlKz8Jw13A0zxuiuQ&s",
      },
      {
        "name": "William",
        "role": "Teacher",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_B8cYF8ZVSmK8ey4GWZx3BSiDAEUDqR8kiLJjQsXjUV2865K8WVq5PYNSHoMpVWlTetU&usqp=CAU",
      },
    ];

    setState(() {
      users = List<User>.from(teachers.map((x) => User.fromJson(x)));
    });
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
        title: const Text('Students List'),
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
