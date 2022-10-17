import 'package:authentication_ui_landlord/features/authentication/presentation/landlord_sign_in/controllers/sign_in_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../custom_widgets/custom_textfield.dart';
import 'forgot_password.dart';
import 'sign_in_button.dart';

class LogInForm extends ConsumerStatefulWidget {
  const LogInForm({super.key});

  @override
  ConsumerState<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends ConsumerState<LogInForm> {
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 390,
        width: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
        ),
        child: Form(
          key: _signInFormKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Log In',
                  style: TextStyle(
                      color: Color.fromARGB(255, 212, 175, 5),
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      fontFamily: 'Roboto Condensed',
                      fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 60,
                  width: 270,
                  child: CustomTextField(
                    controller: _emailController,
                    obscure: false,
                    hint: 'Enter your E-mail ',
                    title: 'E-mail address',
                    prefix: const Icon(Icons.email_outlined),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Email Address cannot be empty";
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 60,
                  width: 270,
                  child: CustomTextField(
                    controller: _emailController,
                    obscure: true,
                    hint: 'Enter your Password ',
                    title: 'Password',
                    prefix: const Icon(Icons.email_outlined),
                    onSaved: (String? password) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      }
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(100, 10, 0, 0),
                child: ForgotPassword(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: SizedBox(
                      height: 60,
                      width: 150,
                      child: LogInButton(
                        onTap: () {
                          ref.read(signInControllerProvider.notifier).signIn(
                              _emailController.text,
                              _passwordController.text,
                              context);
                        },
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
