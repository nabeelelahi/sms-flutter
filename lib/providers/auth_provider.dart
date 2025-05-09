import 'package:flutter/material.dart';
import 'package:sms/config/app_globals.dart';
import 'package:sms/models/user.dart';
import 'package:sms/screens/home.dart';
import 'package:sms/services/request_singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;
  bool get isAuthenticated => _token != null;
  String? get token => _token;
  Map<String, dynamic>? _user;
  Map<String, dynamic>? get user => _user;

  static Future<void> login(
    String email,
    String password,
    AuthProvider authProvider,
  ) async {
    final context = navigatorKey.currentContext;
    RequestSingleton<Map<String, dynamic>>('/user/login', 'POST')
        .setBody({'email': email, 'password': password})
        .onSuccess((data, headers) {
          authProvider._token = data['token'];
          authProvider._user = data['user'];
          print(authProvider._user);
          authProvider.notifyListeners();
          SharedPreferences.getInstance().then((prefs) async {
            await prefs.setString('auth_token', data['token']);
          });
          Navigator.push(
            context!,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        })
        .onFailure((error) {
          print('Login failed: $error');
        })
        .call();
  }

  void logout() {
    _token = null;
    notifyListeners();
  }
}
