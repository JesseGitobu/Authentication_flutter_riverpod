import 'package:flutter/material.dart';

import '../../../../../../constants/app_theme.dart';
import '../../../custom_widgets/custom_button.dart';

class LogInButton extends StatelessWidget {
  final Function()? onTap;
  const LogInButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "Confirm",
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
