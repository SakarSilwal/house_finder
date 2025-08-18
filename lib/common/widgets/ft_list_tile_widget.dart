import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget? leadingIcon;
  final String title;
  final Widget destinationScreen;
  final VoidCallback? onPressed;

  const CustomListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.destinationScreen,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon,
      title: Text(title),
      trailing: destinationScreen,
      onTap: onPressed,
    );
  }
}
