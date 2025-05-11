import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  final double fill;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(6), bottom: Radius.circular(6)),
              color: Color.fromARGB(255, 77, 142, 255),
            ),
          ),
        ),
      ),
    );
  }
}
