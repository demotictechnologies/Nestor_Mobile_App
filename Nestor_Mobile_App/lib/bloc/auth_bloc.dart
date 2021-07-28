import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  var user;
  String img;
  String remName;
  String remPass;
  int notificationCount = 0;
  final PublishSubject _isSessionValid = PublishSubject<bool>();
  PublishSubject<bool> get isSessionValid => _isSessionValid.stream;

  void dispose() {
    _isSessionValid.close();
  }

  void restoreSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      _isSessionValid.sink.add(true);
    } else {
      print("User not found");
      _isSessionValid.sink.add(false);
    }
  }

  void openSession(user) async {
    _isSessionValid.sink.add(true);
    this.user = user;
  }

  void setUpdatedUser(user) async {
    print("setting updated user");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', json.encode(user.toJson()));
    print(json.encode(user.toJson()));

    this.user.user = user;
    print(user);
    _isSessionValid.sink.add(true);
  }

  void setData(value, key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value.toString());
  }

  void setOtp(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('otp', value);
  }

  void storeNotificcationCount(count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('notificationCount', count);
    this.notificationCount = count;
  }

  void rememberMe(String username, String password) async {
    print("Authbloc remember me called");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('rememberUsername', username);
    await prefs.setString('rememberPassword', password);
    this.remName = username;
    this.remPass = password;
    print("Now printing the saved remName and remPass");
    print(this.remName);
    print(this.remPass);
  }

  Future<String> rememberedUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('rememberUsername');
  }

  Future<String> rememberedPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('rememberPassword');
  }

  void closeSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    prefs.remove('token');
    user = null;
    img = null;
    _isSessionValid.sink.add(false);
  }
}



final authBloc = AuthBloc();
