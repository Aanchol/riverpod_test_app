import 'package:flutter/material.dart';

class CustomDropdownField<T> extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.value,
    this.hintText,
    this.labelText,
    this.validator,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.isExpanded = true,
    this.fillColor,
  });

  final T? value;
  final List<T> items;
  final String Function(T) itemLabel;
  final ValueChanged<T?> onChanged;

  final String? hintText;
  final String? labelText;
  final String? Function(T?)? validator;

  final bool enabled;
  final bool isExpanded;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      isExpanded: isExpanded,
      validator: validator,
      onChanged: enabled ? onChanged : null,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(itemLabel(item), overflow: TextOverflow.ellipsis),
        );
      }).toList(),
    );
  }
}
