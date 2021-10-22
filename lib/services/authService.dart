import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:khatapp/services/shared_preferences.dart';
import 'package:flutter/material.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut,
}

class Account {
  final String userId;
  final String email;
  final String username;
  final String password;
  final String token;

  Account({
    this.userId,
    this.email,
    this.username,
    this.password,
    this.token,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        userId: json['id'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        token: json['token']);
  }
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registerationStatus = Status.NotRegistered;

  // ignore: unnecessary_getters_setters
  Status get loggedInStatus => _loggedInStatus;
  // ignore: unnecessary_getters_setters
  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  // ignore: unnecessary_getters_setters
  Status get registerationStatus => _registerationStatus;
  // ignore: unnecessary_getters_setters
  set registerationStatus(Status value) {
    _registerationStatus = value;
  }

  Future userSignup(email, username, password) async {
    final response = await http
        .post(
          Uri.parse('http://192.168.0.100:3000/signup'),
          headers: {
            'Content-type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'email': email,
            'username': username,
            'password': password,
          }),
        )
        .then(success);

    return response;
  }

  Future userLogin(username, password) async {
    final response = await http
        .post(
          Uri.parse('http://192.168.0.100:3000/login'),
          headers: {
            'Content-type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'username': username,
            'password': password,
          }),
        )
        .then(success);
    return response;
  }
}

Future success(http.Response response) async {
  var result = {};
  final data = jsonDecode(response.body);

  if (response.statusCode == 200) {
    tokenGen(data['data']['id'], data['data']['token']);

    Account authUser = Account.fromJson(data['data']);
    UserPreferences().saveUser(authUser);
    result = {
      'status': true,
      'message': 'Success',
      'data': authUser,
    };
  } else {
    result = {
      'status': false,
      'message': 'Failed',
      'data': response,
    };
  }

  return result;
}

Future tokenGen(userId, token) async {
  final tokenResponse = await http.post(
    Uri.parse('http://192.168.0.100:3000/tokengen'),
    headers: {
      'Content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'userId': userId,
      'token': token,
    }),
  );
  return tokenResponse;

  // print(tokenResponse.body);
  // print("this is the token data that was printed");
}

class UserProvider extends ChangeNotifier {
  Account _user = Account();
  Account get user => _user;
  void setUser(Account user) {
    _user = user;
    notifyListeners();
  }
}
