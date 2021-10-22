import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class SignUp {
  final String email;
  final String username;
  final String password;

  SignUp({
    this.email,
    this.username,
    this.password,
  });

  factory SignUp.fromJson(Map<String, dynamic> json) {
    return SignUp(
      email: json['email'],
      username: json['username'],
      password: json['password'],
    );
  }
}

class Login {
  final String username;
  final String password;

  Login({
    this.username,
    this.password,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      username: json['username'],
      password: json['password'],
    );
  }
}

Future tokenGen(data) async {
  final tokenResponse = await http.post(
    Uri.parse('http://192.168.0.100:3000/tokengen'),
    headers: {
      'Content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'userId': data['data']['id'],
      'token': data['token'],
    }),
  );
  print(tokenResponse.body);
  print("this is the token data that was printed");
}

Future<SignUp> userSignup(email, username, password) async {
  final response = await http.post(
    Uri.parse('http://192.168.0.100:3000/signup'),
    headers: {
      'Content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'email': email,
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    tokenGen(data);
    return SignUp.fromJson(data);
  } else {
    print('failed');
    throw Exception('faild to create user');
  }
}

Future<Login> userLogin(username, password) async {
  final response = await http.post(
    Uri.parse('http://192.168.0.100:3000/login'),
    headers: {
      'Content-type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'username': username,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    tokenGen(data);
    print('success');
    return Login.fromJson(data);
  } else {
    throw Exception('failed to login for some reason');
  }
}
