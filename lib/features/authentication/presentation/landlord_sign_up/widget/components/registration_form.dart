import 'package:authentication_ui_landlord/features/authentication/presentation/landlord_sign_up/controller/sign_up_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../custom_widgets/custom_textfield.dart';
import 'registration_button.dart';

class RegistrationForm extends ConsumerStatefulWidget {
  const RegistrationForm({super.key});

  @override
  ConsumerState<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends ConsumerState<RegistrationForm> {
  final _signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _snameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fnameController.dispose();
    _snameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: const Text(
              'Register',
              style: TextStyle(
                  color: Color.fromARGB(255, 212, 175, 5),
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                  fontFamily: 'Roboto Condensed',
                  fontSize: 24),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                SizedBox(
                  height: 55,
                  width: 130,
                  child: CustomTextField(
                    controller: _emailController,
                    obscure: false,
                    hint: 'Enter your First Name ',
                    title: 'First Name',
                    prefix: const Icon(Icons.email_outlined),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "First Name cannot be empty";
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 55,
                  width: 140,
                  child: CustomTextField(
                    controller: _emailController,
                    obscure: false,
                    hint: 'Enter your Second Name',
                    title: 'Second Name',
                    prefix: const Icon(Icons.email_outlined),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Second Name cannot be empty";
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 55,
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
          const SizedBox(height: 8),
          SizedBox(
            height: 55,
            width: 270,
            child: CustomTextField(
              controller: _emailController,
              obscure: false,
              hint: 'Enter your Phone Number ',
              title: 'Phone Number',
              prefix: const Icon(Icons.email_outlined),
              onSaved: (String? value) {},
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "phone Number cannot be empty";
                }
              },
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 55,
            width: 270,
            child: CustomTextField(
              controller: _emailController,
              obscure: false,
              hint: 'Enter your Password',
              title: 'Password',
              prefix: const Icon(Icons.email_outlined),
              onSaved: (String? value) {},
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Password cannot be empty";
                }
              },
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: SizedBox(
              height: 60,
              width: 150,
              child:
                  // ElevatedButton(
                  //   onPressed: () {
                  //     print('object');
                  //     ref.read(signUpControllerProvider.notifier).SignUp(
                  //         _fnameController.text,
                  //         _snameController.text,
                  //         _emailController.text,
                  //         _phoneController.text,
                  //         _passwordController.text,
                  //         context);
                  //   },
                  //   child: Text('Register'),
                  // )
                  RegisterButton(
                onTap: () {
                  ref.read(signUpControllerProvider.notifier).SignUp(
                      _fnameController.text,
                      _snameController.text,
                      _emailController.text,
                      _phoneController.text,
                      _passwordController.text,
                      context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
