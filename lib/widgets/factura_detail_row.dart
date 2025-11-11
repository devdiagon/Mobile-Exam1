import 'package:flutter/material.dart';

class FacturaDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const FacturaDetailRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
