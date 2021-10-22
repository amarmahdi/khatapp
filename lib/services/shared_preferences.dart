import 'package:shared_preferences/shared_preferences.dart';
import './authService.dart';

class UserPreferences {
  Future<bool> saveUser(Account user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', user.userId);
    prefs.setString('email', user.email);
    prefs.setString('username', user.username);
    prefs.setString('token', user.token);
    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<Account> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId');
    String email = prefs.getString('email');
    String username = prefs.getString('username');
    String token = prefs.getString('token');

    return Account(
      userId: userId,
      email: email,
      username: username,
      token: token,
    );
  }
}
