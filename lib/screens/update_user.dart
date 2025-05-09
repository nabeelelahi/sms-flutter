import 'package:flutter/material.dart';
import '../theme/color.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({super.key});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureRetypePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tintedBg,
      appBar: AppBar(
        title: const Text('Update User'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              const Text(
                "Update Profile\nInformation",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.tintedBlack,
                ),
              ),
              const SizedBox(height: 40),

              const Text(
                "Email address",
                style: TextStyle(fontSize: 14, color: AppColors.tintedBlack),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Jamessup",
                  hintStyle: const TextStyle(color: AppColors.mutedText),
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Password",
                style: TextStyle(fontSize: 14, color: AppColors.tintedBlack),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: "Input your password",
                  hintStyle: const TextStyle(color: AppColors.mutedText),
                  filled: true,
                  fillColor: AppColors.white,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.tintedBlack,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Re-type Password",
                style: TextStyle(fontSize: 14, color: AppColors.tintedBlack),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _retypePasswordController,
                obscureText: _obscureRetypePassword,
                decoration: InputDecoration(
                  hintText: "Input your password",
                  hintStyle: const TextStyle(color: AppColors.mutedText),
                  filled: true,
                  fillColor: AppColors.white,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureRetypePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.tintedBlack,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureRetypePassword = !_obscureRetypePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.tintedBlack,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
