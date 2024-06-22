import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  const SimpleButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
        ),
        child: Icon(icon),
      ),
    );
  }
}
