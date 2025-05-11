import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/config/app_globals.dart';
import 'package:sms/models/user.dart';
import 'package:sms/screens/home.dart';
import 'package:sms/screens/splash.dart';
import 'package:sms/screens/user_detail.dart';
import 'package:sms/screens/user_list.dart';
import 'package:sms/services/request_singleton.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  User? _user;
  bool _isLoading = false;

  bool get isAuthenticated => _token != null;
  String? get token => _token;
  User? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('auth_token');
    final userString = prefs.getString('auth_user');
    if (userString != null) {
      _user = User.fromJson(jsonDecode(userString));
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    final context = navigatorKey.currentContext;
    RequestSingleton<Map<String, dynamic>>('/user/login', 'POST')
        .setBody({'email': email, 'password': password})
        .onSuccess((data, headers) async {
          _token = data['token'];
          _user = User.fromJson(data['data']);
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', data['token']);
          await prefs.setString('auth_user', jsonEncode(data['data']));
          _isLoading = false;
          notifyListeners();
          if (user!.role == 'teacher') {
            Navigator.push(
              context!,
              MaterialPageRoute(
                builder: (context) => UserListScreen(role: 'student'),
              ),
            );
          } else if (user!.role == 'student') {
            Navigator.push(
              context!,
              MaterialPageRoute(
                builder: (context) => UserDetailsScreen(user: user!),
              ),
            );
          } else {
            Navigator.push(
              context!,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        })
        .onFailure((error) {
          _isLoading = false;
          notifyListeners();
          print('Login failed: $error');
        })
        .call();
  }

  void logout() async {
    _isLoading = true;
    notifyListeners();
    final context = navigatorKey.currentContext;
    RequestSingleton<Map<String, dynamic>>('/user/logout', 'POST')
        .onSuccess((data, headers) async {
          _isLoading = false;
          _token = null;
          _user = null;
          final prefs = await SharedPreferences.getInstance();
          await prefs.remove('auth_token');
          await prefs.remove('auth_user');
          notifyListeners();
          Navigator.push(
            context!,
            MaterialPageRoute(builder: (context) => SplashScreen()),
          );
        })
        .onFailure((error) {
          _isLoading = false;
          notifyListeners();
          print('Logout failed: $error');
        })
        .call();
  }
}
