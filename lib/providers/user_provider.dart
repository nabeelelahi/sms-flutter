

import 'package:flutter/material.dart';
import 'package:sms/config/app_globals.dart';
import '../models/user.dart';
import '../services/request_singleton.dart';

class UserProvider with ChangeNotifier {
  final Map<String, List<User>> _roleUsers = {};
  final Map<String, bool> _loadingStatus = {};
  bool _formLoading = false;
  List<User> getUsers(String role) => _roleUsers[role] ?? [];

  bool isLoading(String role) => _loadingStatus[role] ?? false;
  get isFormLoading => _formLoading;

  Future<void> fetchUsersByRole(String role) async {
    _loadingStatus[role] = true;
    notifyListeners();
    await RequestSingleton<List<dynamic>>('/user/$role/role', 'GET')
        .onSuccess((data, headers) {
          // print(data);
          _roleUsers[role] = List<User>.from(data.map((x) => User.fromJson(x)));
        })
        .onFailure((error) {
          _roleUsers[role] = [];
          debugPrint('Fetch failed: $error');
        })
        .call();
    _loadingStatus[role] = false;
    notifyListeners();
  }

  void addUser(
    String name,
    String email,
    int age,
    String residence,
    String password,
  ) {
    _formLoading = true;
    notifyListeners();
    final context = navigatorKey.currentContext;
    RequestSingleton<Map<String, dynamic>>('/user/register', 'POST')
        .setBody({
          'name': name,
          'email': email,
          'age': age,
          'residence': residence,
          'password': password,
        })
        .onSuccess((data, headers) async {
          _roleUsers['student'] = [
            ...getUsers('student'),
            User.fromJson(data['data']),
          ];
          _formLoading = false;
          notifyListeners();
          Navigator.pop(context!);
        })
        .onFailure((error) {
          print('Registration failed: $error');
        })
        .call();
  }

  void updateUser(
    int id,
    String name,
    String email,
    int age,
    String residence,
  ) {
    _formLoading = true;
    notifyListeners();
    final context = navigatorKey.currentContext;
    RequestSingleton('/user/$id', 'PUT')
        .setBody({
          'name': name,
          'email': email,
          'age': age,
          'residence': residence,
        })
        .onSuccess((data, headers) async {
          final record = User.fromJson(data['data']);
          _roleUsers[record.role] = List<User>.from(
            _roleUsers[record.role]!.map((x) => x.id == record.id ? record : x),
          );
          _formLoading = false;
          notifyListeners();
          Navigator.pop(context!);
        })
        .onFailure((error) {
          print('Registration failed: $error');
        })
        .call();
  }

  void updateUserRole(int id, String role, String previousRole) {
    _formLoading = true;
    notifyListeners();
    final context = navigatorKey.currentContext;
    RequestSingleton('/user/$id/role', 'PUT')
        .setBody({'role': role})
        .onSuccess((data, headers) async {
          final record = User.fromJson(data['data']);
          _roleUsers[previousRole] =
              getUsers(previousRole).where((u) => u.id != record.id).toList();
          _roleUsers[role] = [...getUsers(role), record];
          _formLoading = false;
          notifyListeners();
          Navigator.pop(context!);
        })
        .onFailure((error) {
          print('Registration failed: $error');
        })
        .call();
  }

  void removeUser(int id, String role) {
    _formLoading = true;
    notifyListeners();
    final context = navigatorKey.currentContext;
    RequestSingleton('/user/$id', 'DELETE')
        .onSuccess((data, headers) async {
          _roleUsers[role] = getUsers(role).where((u) => u.id != id).toList();
          _formLoading = false;
          notifyListeners();
          Navigator.pop(context!);
        })
        .onFailure((error) {
          print('Registration failed: $error');
        })
        .call();
    notifyListeners();
  }
}
