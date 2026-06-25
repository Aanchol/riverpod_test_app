import 'package:flutter/material.dart';

class CustomSegmentedButton<T> extends StatelessWidget {
  const CustomSegmentedButton({
    super.key,
    required this.segments,
    required this.selectedValue,
    required this.onChanged,
    this.multiSelectionEnabled = false,
    //this.emptySelectionAllowed = false,
  });

  final List<ButtonSegment<T>> segments;
  final Set<T> selectedValue;
  final ValueChanged<Set<T>> onChanged;
  final bool multiSelectionEnabled;

  //final bool emptySelectionAllowed;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<T>(
      segments: segments,
      selected: selectedValue,
      multiSelectionEnabled: multiSelectionEnabled,
      onSelectionChanged: onChanged,
    );
  }
}
