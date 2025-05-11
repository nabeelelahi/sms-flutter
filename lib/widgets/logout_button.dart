import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms/providers/auth_provider.dart';
import 'package:sms/theme/color.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return authProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : Container(
          margin: EdgeInsets.symmetric(horizontal: 7),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: AppColors.tintedBlack,
              padding: EdgeInsets.all(15),
            ),
            icon: const Icon(Icons.logout),
            color: AppColors.white,
            iconSize: 20,
            onPressed: () {
              authProvider.logout();
            },
          ),
        );
  }
}
