import 'package:flutter/material.dart';
import 'package:sms/screens/register.dart';
import 'package:sms/theme/color.dart';
import '../models/user.dart';
import '../widgets/user_card.dart';
import 'package:flutter/services.dart';
import 'user_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, List<User>> users = {
    'teachers': [],
    'students': [],
    'admins': [],
  };

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
    ];
    final List<Map<String, dynamic>> students = [
      {
        "name": "Jon",
        "role": "Student",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_B8cYF8ZVSmK8ey4GWZx3BSiDAEUDqR8kiLJjQsXjUV2865K8WVq5PYNSHoMpVWlTetU&usqp=CAU",
      },
      {
        "name": "Charley",
        "role": "Student",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4UlS1Ehv87B7_HRdQWlKz8Jw13A0zxuiuQ&s",
      },
      {
        "name": "Jon",
        "role": "Student",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_B8cYF8ZVSmK8ey4GWZx3BSiDAEUDqR8kiLJjQsXjUV2865K8WVq5PYNSHoMpVWlTetU&usqp=CAU",
      },
      {
        "name": "Charley",
        "role": "Student",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4UlS1Ehv87B7_HRdQWlKz8Jw13A0zxuiuQ&s",
      },
      {
        "name": "Jon",
        "role": "Student",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_B8cYF8ZVSmK8ey4GWZx3BSiDAEUDqR8kiLJjQsXjUV2865K8WVq5PYNSHoMpVWlTetU&usqp=CAU",
      },
      {
        "name": "Charley",
        "role": "Student",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4UlS1Ehv87B7_HRdQWlKz8Jw13A0zxuiuQ&s",
      },
    ];
    final List<Map<String, dynamic>> admins = [
      {
        "name": "Jon",
        "role": "Student",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_B8cYF8ZVSmK8ey4GWZx3BSiDAEUDqR8kiLJjQsXjUV2865K8WVq5PYNSHoMpVWlTetU&usqp=CAU",
      },
      {
        "name": "Charley",
        "role": "Student",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4UlS1Ehv87B7_HRdQWlKz8Jw13A0zxuiuQ&s",
      },
      {
        "name": "Jon",
        "role": "Student",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_B8cYF8ZVSmK8ey4GWZx3BSiDAEUDqR8kiLJjQsXjUV2865K8WVq5PYNSHoMpVWlTetU&usqp=CAU",
      },
      {
        "name": "Charley",
        "role": "Student",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4UlS1Ehv87B7_HRdQWlKz8Jw13A0zxuiuQ&s",
      },
      {
        "name": "Jon",
        "role": "Student",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_B8cYF8ZVSmK8ey4GWZx3BSiDAEUDqR8kiLJjQsXjUV2865K8WVq5PYNSHoMpVWlTetU&usqp=CAU",
      },
      {
        "name": "Charley",
        "role": "Student",
        "id": "#75848759",
        "location": "Dubai,UAE",
        "image":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4UlS1Ehv87B7_HRdQWlKz8Jw13A0zxuiuQ&s",
      },
    ];

    setState(() {
      users['teachers'] = List<User>.from(
        teachers.map((x) => User.fromJson(x)),
      );
      users['students'] = List<User>.from(
        students.map((x) => User.fromJson(x)),
      );
      users['admins'] = List<User>.from(admins.map((x) => User.fromJson(x)));
    });
  }

  @override
  void initState() {
    super.initState();
    loadUsers();
    print(users);
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap:
                    () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserListScreen(),
                        ),
                      ),
                    },
                child: const Text(
                  "See All",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return UserCard(user: userList[index], backgroundColor: bgColor);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('Dawoud Rabih'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
      // users['teachers']!.isEmpty
      // ? const Center(child: CircularProgressIndicator())
      // :
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              buildSection(
                "Teachers Lists",
                users['teachers']!,
                AppColors.green,
              ),
              buildSection(
                "Student Lists",
                users['students']!,
                AppColors.orange,
              ),
              buildSection("School Admins", users['admins']!, AppColors.yellow),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen()),
          );
        },
        backgroundColor: AppColors.tintedBlack,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
