import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });
  final String value;
  final void Function(String?) onChanged;
  final String groupValue;

  @override
  Widget build(BuildContext context) {
    return Radio(value: value, onChanged: onChanged, groupValue: groupValue);
  }
}
