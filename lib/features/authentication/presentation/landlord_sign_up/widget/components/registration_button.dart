import 'package:flutter/material.dart';

import '../../../../../../constants/app_theme.dart';
import '../../../custom_widgets/custom_button.dart';

class RegisterButton extends StatelessWidget {
  final Function()? onTap;
  const RegisterButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "Register",
      titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.none,
          fontFamily: 'Roboto Condensed',
          fontSize: 24),
      gradiant: const [AppTheme.gold],
      onTap: onTap,
    );
  }
}
