import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../constants/app_theme.dart';

enum ButtonState { idle, loading, disabled }

class CustomButton extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final ButtonState state;
  final Widget? leadingIcon;
  final List<Color>? gradiant;
  final Function()? onTap;
  final bool outline;

  const CustomButton({
    Key? key,
    required this.title,
    required this.titleStyle,
    this.state = ButtonState.idle,
    this.leadingIcon,
    this.gradiant,
    required this.onTap,
    this.outline = false,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final defaultColor = widget.gradiant ?? [AppTheme.red, AppTheme.gold];
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.cardPadding * 1.5,
            vertical: AppTheme.elementSpacing),
        height: AppTheme.buttonHeight,
        decoration: BoxDecoration(
            color: defaultColor.length < 2 ? defaultColor.first : null,
            borderRadius: BorderRadius.circular(99),
            border: widget.outline
                ? Border.all(
                    color: AppTheme.grey,
                  )
                : null,
            gradient: defaultColor.length > 1
                ? LinearGradient(
                    colors: defaultColor,
                  )
                : null),
        child: widget.state == ButtonState.loading
            ? Center(
                child: Transform.scale(
                    scale: 0.6,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(AppTheme.white),
                    )))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.leadingIcon != null)
                    Padding(
                      padding:
                          const EdgeInsets.only(right: AppTheme.elementSpacing),
                      child: widget.leadingIcon,
                    ),
                  Text(
                    widget.title,
                    style: widget.titleStyle,
                  ),
                ],
              ),
      ),
    );
  }
}

class FodaCircleButton extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final ButtonState state;
  final Widget? icon;
  final EdgeInsets? padding;
  final List<Color>? gradiant;
  final Function()? onTap;

  const FodaCircleButton({
    Key? key,
    required this.title,
    this.titleStyle,
    this.state = ButtonState.idle,
    this.icon,
    this.gradiant,
    this.padding,
    required this.onTap,
  }) : super(key: key);

  @override
  State<FodaCircleButton> createState() => _FodaCircleButtonState();
}

class _FodaCircleButtonState extends State<FodaCircleButton> {
  @override
  Widget build(BuildContext context) {
    final defaultColor = widget.gradiant ?? [AppTheme.red, AppTheme.darkBlue];
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: widget.padding ?? const EdgeInsets.all(12),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: defaultColor.length < 2 ? defaultColor.first : null,
            gradient: defaultColor.length > 1
                ? LinearGradient(
                    colors: defaultColor,
                  )
                : null),
        child: widget.state == ButtonState.loading
            ? Center(
                child: Transform.scale(
                    scale: 0.6,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(AppTheme.white),
                    )))
            : widget.icon,
      ),
    );
  }
}
