import 'package:flutter/material.dart';

class ScannerButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Widget widget;
  final Color backgroundColor;

  const ScannerButtonWidget({
    Key? key,
    required this.backgroundColor,
    required this.onTap,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: widget,
        ),
      ),
    );
  }
}
