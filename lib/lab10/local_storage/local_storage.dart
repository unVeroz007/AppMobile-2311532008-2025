import 'package:shared_preferences/shared_preferences.dart';
class LocalStorage {
  static const String _token = 'token';
  static const String _refreshToken = 'refreshToken';

  // Menyimpan token
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, token);
  }
  // Mengambil token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }
  // Menyimpan refresh token
  static Future<void> saveRefreshToken(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_refreshToken, refreshToken);
  }
  // Mengambil refresh token
  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshToken);
  }
  // Menghapus semua data (untuk logout)
  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}