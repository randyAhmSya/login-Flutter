import 'package:flutter_login/models/model_user.dart';

class UserData {
  static List<User> registeredUsers = [];

  // Method untuk menambahkan pengguna baru
  static void addUser(User user) {
    registeredUsers.add(user);
  }

  // Method untuk mengecek pengguna berdasarkan email dan password
  static User? loginUser(String email, String password) {
    try {
      return registeredUsers.firstWhere(
          (user) => user.email == email && user.password == password);
    } catch (e) {
      return null; // Kembalikan null jika pengguna tidak ditemukan
    }
  }
}
