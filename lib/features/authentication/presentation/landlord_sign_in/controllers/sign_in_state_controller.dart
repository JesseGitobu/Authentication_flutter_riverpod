import 'package:authentication_ui_landlord/features/authentication/data/user_repository.dart';
import 'package:authentication_ui_landlord/features/authentication/presentation/landlord_sign_in/states/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInController extends StateNotifier<SignInState> {
  SignInController(this.ref) : super(const SignInStateInitial());

  final Ref ref;

  void signIn(String email, String password, BuildContext context) async {
    state = const SignInStateLoading();

    try {
      await ref
          .read(UserRepositoryProvider)
          .signInUser(email, password, context);
      state = const SignInStateSuccess();
    } catch (e) {
      state = SignInStateError(e.toString());
    }
  }
}

final signInControllerProvider =
    StateNotifierProvider<SignInController, SignInState>((ref) {
  return SignInController(ref);
});
