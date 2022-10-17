import 'package:authentication_ui_landlord/features/authentication/domain_model/user.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../error_handling.dart';
import '../application/auth_service.dart';

abstract class BaseUserRepository {
  Future<String> signInUser(
      String email, String password, BuildContext context);

  Future<String> signUpUser(String firstName, String secondName, String email,
      String phoneNumber, String password, BuildContext context);

  Future<void> signOut();
  Stream<User?> get authStateChanges;
}

class UserRepository implements BaseUserRepository {
  final AuthService _authService;
  UserRepository(this._authService);

  @override
  Future<String> signUpUser(String firstName, String secondName, String email,
      String phoneNumber, String password, BuildContext context) async {
    return _authService.signUpUser(
        firstName, secondName, email, phoneNumber, password, context);
  }

  @override
  // TODO: implement authStateChanges
  Stream<User?> get authStateChanges => throw UnimplementedError();

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<String> signInUser(
      String email, String password, BuildContext context) async {
    return _authService.signInUser(email, password, context);
  }
}

final UserRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository(ref.read(authServiceProvider));
});
