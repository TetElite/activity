import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final IconData? icon;

  const BlaButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isPrimary = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = isPrimary
        ? ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            minimumSize: const Size(double.infinity, 48),
          )
        : OutlinedButton.styleFrom(
            foregroundColor: Colors.blue,
            side: const BorderSide(color: Colors.blue),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            minimumSize: const Size(double.infinity, 48),
          );

    if (isPrimary) {
      return icon != null
          ? ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon),
              label: Text(label),
              style: buttonStyle,
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: buttonStyle,
              child: Text(label),
            );
    } else {
      return icon != null
          ? OutlinedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon),
              label: Text(label),
              style: buttonStyle,
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: buttonStyle,
              child: Text(label),
            );
    }
  }
}
