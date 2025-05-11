import 'package:flutter/material.dart';
import 'package:sms/theme/color.dart';
import 'login.dart';
import 'home.dart';
import 'package:sms/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    _navigateToHome();
    });
  }

  void _navigateToHome() async {
    final authProvider = Provider.of<AuthProvider>(context,listen: false);
    await authProvider.loadFromPrefs();
    await Future.delayed(const Duration(seconds: 3));
    final user = authProvider.user;
    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.tintedBg,
      body: Center(
        child: Text(
          'School Management App',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.tintedBlack,
          ),
        ),
      ),
    );
  }
}
