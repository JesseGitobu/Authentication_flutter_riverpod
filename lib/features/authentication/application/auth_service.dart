import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../error_handling.dart';
import '../../../home_screen.dart';
import '../domain_model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/landlord_sign_in/controllers/user_providers.dart';

String uri = 'http://192.168.131.49:4000';
final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class AuthService {
  Future<String> signUpUser(
    String firstName,
    String secondName,
    String email,
    String phoneNumber,
    String password,
    BuildContext context,
  ) async {
    User user = User(
      id: '',
      firstname: firstName,
      secondname: secondName,
      email: email,
      phone: phoneNumber,
      password: password,
    );
    final http.Response res = await http.post(
      Uri.parse('$uri/api/signup'),
      body: user.toJson(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    try {
      print('object');
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              'Account created! Login with the same credentials!',
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    // return Future.delayed(const Duration(milliseconds: 5000))
    //     .then((onValue) => 'authToken');
    // try {
    //   User user = User(
    //     id: '',
    //     firstname: firstName,
    //     secondname: secondName,
    //     email: email,
    //     phone: phoneNumber,
    //     password: password,
    //   );
    // http.Response res = await http.post(
    //   Uri.parse('$uri/api/signup'),
    //   body: user.toJson(),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // );

    // httpErrorHandle(
    //   response: res,
    //   context: context,
    //   onSuccess: () {
    // showSnackBar(
    //   context,
    //   'Account created! Login with the same credentials!',
    // );
    //   },
    // );
    // } catch (e) {
    //   showSnackBar(context, e.toString());
    // }
    return jsonDecode(res.body);
  }

  Future<String> signInUser(
      String email, String password, BuildContext context) async {
    final http.Response res = await http.post(
      Uri.parse('$uri/api/signin'),
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    try {
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return jsonDecode(res.body);
    // return Future.delayed(const Duration(milliseconds: 5000))
    //     .then((onValue) => 'authToken');
  }
}
