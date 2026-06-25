import 'package:flutter/material.dart';
import 'package:riverpod_test_app/core/themes/app_text_styles.dart';

import '../themes/app_colors.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final Widget? leading;
  final Color? selectedColor;
  final Color? backgroundColor;
  final bool? showCheckMark;

  const CustomFilterChip({
    super.key,
    required this.label,
    required this.selected,
    this.onTap,
    this.leading,
    this.selectedColor,
    this.backgroundColor,
    this.showCheckMark,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      avatar: leading,
      selected: selected,
      onSelected: (_) => onTap?.call(),
      selectedColor: selectedColor ?? AppColors.white,
      backgroundColor: backgroundColor ?? AppColors.white,
      checkmarkColor: AppColors.black,
      labelStyle: AppTextStyles.labelTextStyle.copyWith(
        color: selected ? AppColors.black : AppColors.black,
        fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: selected ? AppColors.black : AppColors.textSecondary,
        ),
      ),
      showCheckmark: showCheckMark,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
