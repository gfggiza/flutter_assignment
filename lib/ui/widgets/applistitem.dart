import 'package:flutter/material.dart';
import '../appui.dart';

class _InternalValues {
  static const double listPadding = 15;
  static const double borderRadius = 18;
  static const double chipSpacing = 1;
}

class AppListItem extends StatelessWidget {
  const AppListItem({
    super.key,
    required this.itemTitle,
    required this.year,
    this.chip,
    this.chipName,
    this.onPressed,
  });

  final String itemTitle;
  final String year;
  final AppChip? chip;
  final String? chipName;
  final void Function()? onPressed;

  EdgeInsets _buildListPadding() {
    return const EdgeInsets.fromLTRB(
      _InternalValues.listPadding, // Left padding doubled
      0,
      _InternalValues.listPadding,
      0,
    );
  }

  Widget _buildListTitle() {
    return Text(
      itemTitle,
      style: const TextStyle(
        color: AppColors.textColor,
        fontSize: AppFontSize.h3,
      ),
    );
  }

  Widget _buildChipIfAvailable() {
    if (chip != null) {
      return Row(
        children: [
          AppChip(
            label: chipName?.toString() ?? '',
            year: year,
          ),
          const SizedBox(width: _InternalValues.chipSpacing),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _buildList() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(_InternalValues.listPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListTitle(),
            const SizedBox(height: _InternalValues.listPadding),
            _buildChipIfAvailable(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _buildListPadding(),
      child: GestureDetector(
        onTap: onPressed,
        behavior:
            HitTestBehavior.opaque, // Ensures tap detection works properly
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.baseBgColor,
            border: Border.all(
              color: AppColors.sidelineColor,
            ),
            borderRadius: BorderRadius.circular(_InternalValues.borderRadius),
          ),
          child: _buildList(),
        ),
      ),
    );
  }
}
