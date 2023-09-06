import 'package:flutter/material.dart';

class ContentItem extends StatelessWidget {
  final String label;
  final double width;
  final Color backgroundColor;
  const ContentItem(
      {super.key,
      required this.label,
      required this.width,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      color: backgroundColor,
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            //color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
