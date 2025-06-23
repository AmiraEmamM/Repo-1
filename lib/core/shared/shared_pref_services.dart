import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static const String _keyUsername = 'username';
  static const String _keyPassword = 'password';
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _imagePathKey = 'profile_image';

  static Future<void> saveUser(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUsername, username);
    await prefs.setString(_keyPassword, password);
  }

  static Future<bool> isUsernameTaken(String username) async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString(_keyUsername);
    return storedUsername == username;
  }


  static Future<bool> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString(_keyUsername);
    final storedPassword = prefs.getString(_keyPassword);

    if (storedUsername == username && storedPassword == password) {
      await prefs.setBool(_keyIsLoggedIn, true);
      return true;
    }
    return false;
  }
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, false);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  static Future<String?> getImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_imagePathKey);
  }

  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }
  static Future<void> saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imagePathKey, path);
  }
}
Future<String?> pickProfileImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);
  if (pickedFile != null) {
    await SharedPrefService.saveImagePath(pickedFile.path);
    return pickedFile.path;
  }
  return null;
}