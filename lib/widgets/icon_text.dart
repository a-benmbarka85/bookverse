import 'package:flutter/material.dart';
import 'package:bookverse/styles/app_styles.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize = 24,
    this.textStyle,
  });

  final IconData icon;
  final String text;
  final double iconSize;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        Icon(icon, size: iconSize),
        AppStyles.smallSeparator,
        Text(text, style: textStyle),
      ],
    );
  }
}