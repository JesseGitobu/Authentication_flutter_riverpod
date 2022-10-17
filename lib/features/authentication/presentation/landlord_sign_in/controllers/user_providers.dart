import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain_model/user.dart';

final userProvider = ChangeNotifierProvider((ref) {
  return UserProvider();
});

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    firstname: '',
    secondname: '',
    email: '',
    phone: '',
    password: '',
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
