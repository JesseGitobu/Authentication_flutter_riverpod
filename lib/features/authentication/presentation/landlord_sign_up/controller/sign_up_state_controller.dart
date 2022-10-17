import 'package:authentication_ui_landlord/features/authentication/data/user_repository.dart';
import 'package:authentication_ui_landlord/features/authentication/presentation/landlord_sign_up/states/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpController extends StateNotifier<SignUpState> {
  SignUpController(this.ref) : super(const SignUpStateInitial());

  final Ref ref;

  void SignUp(String firstName, String secondName, String email,
      String phoneNumber, String password, BuildContext context) async {
    state = const SignUpStateLoading();

    try {
      print('object');
      await ref.read(UserRepositoryProvider).signUpUser(
          firstName, secondName, email, phoneNumber, password, context);
      state = const SignUpStateSuccess();
    } catch (e) {
      state = SignUpStateError(e.toString());
    }
  }
}

final signUpControllerProvider =
    StateNotifierProvider<SignUpController, SignUpState>((ref) {
  return SignUpController(ref);
});
