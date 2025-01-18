import 'package:flutter/material.dart';
import 'package:spotify_clone/data/model/user.dart';

class UserDataSource {
  final List<User> _users = [
    User(username: 'free_user', password: '123', userType: 'free'),
    User(username: 'premium_user', password: '123', userType: 'premium'),
  ];

  User? authenticateUser(String username, String password) {
    try {
      return _users.firstWhere(
        (user) => user.username == username && user.password == password,
        orElse: () => throw Exception('Invalid credentials'),
      );
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
