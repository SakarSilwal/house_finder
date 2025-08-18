import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color? foregroundColor;
  final String text;
  final Color textColor;
  final Widget? prefixIcon;
  final double? textSize;
  final FontWeight? fontWeight;

  const CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.onPressed,
    required this.backgroundColor,
    this.foregroundColor,
    required this.text,
    required this.textColor,
    this.prefixIcon,
    this.textSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          textStyle: TextStyle(
            color: textColor,
            fontSize: textSize,
            fontWeight: fontWeight,
          ),
        ),
        onPressed: onPressed,
        // child: Text(text, style: TextStyle(color: textColor)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[prefixIcon!, SizedBox(height: 12)],
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
