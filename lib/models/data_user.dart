import 'package:flutter_login/models/model_user.dart';

class UserData {
  static List<User> registeredUsers = [];

  static void addUser(User user) {
    registeredUsers.add(user);
  }

  static User? loginUser(String email, String password) {
    try {
      return registeredUsers.firstWhere(
          (user) => user.email == email && user.password == password);
    } catch (e) {
      return null;
    }
  }
}
