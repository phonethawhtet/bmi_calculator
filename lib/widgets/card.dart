import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double height;
  final Color selectedColor;

  const CustomCard({
    Key? key,
    required this.child,
    this.borderRadius = 10.0,
    required this.height,
    this.selectedColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(1.0, 1.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
