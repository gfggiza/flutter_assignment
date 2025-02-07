import 'package:assignment/ui/appui.dart';
import 'package:flutter/material.dart';

enum AppChipTheme {
  outlined,
  filled,
}

class _InternalValues {
  static const double rowPadding = 10;
  static const double borderRadius = 20;
}

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    this.label,
    this.year,
    this.chipTheme = AppChipTheme.filled,
  });

  const AppChip.filled({
    super.key,
    this.label,
    this.year,
  }) : chipTheme = AppChipTheme.filled;

  const AppChip.outlined({
    super.key,
    this.label,
    this.year,
  }) : chipTheme = AppChipTheme.outlined;

  final String? label;
  final String? year;
  final AppChipTheme chipTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: _InternalValues.rowPadding,
      children: [
        Chip(
          padding: EdgeInsets.zero,
          elevation: 0,
          label: Text(label!),
          backgroundColor: chipTheme == AppChipTheme.filled
              ? AppColors.baseColor
              : AppColors.bgColor,
          labelStyle: TextStyle(
            color: chipTheme == AppChipTheme.filled
                ? AppColors.baseBgColor
                : AppColors.baseColor,
            fontSize: AppFontSize.body,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_InternalValues.borderRadius),
          ),
          side: chipTheme == AppChipTheme.filled
              ? null
              : const BorderSide(
                  color: AppColors.sidelineColor,
                ),
        ),
        if (year != null)
          Text(
            year!,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: AppFontSize.body,
            ),
          ),
      ],
    );
  }
}
