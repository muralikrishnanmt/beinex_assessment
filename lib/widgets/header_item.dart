import 'package:flutter/material.dart';

class HeaderItem extends StatelessWidget {
  final String label;
  final double width;
  const HeaderItem({super.key, required this.label, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      color: const Color.fromARGB(255, 9, 80, 138),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
