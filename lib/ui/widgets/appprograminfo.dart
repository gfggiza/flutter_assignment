import 'package:flutter/material.dart';
import '/ui/appui.dart';

class _InternalValues {
  static const double titleMargin = 40;
  static const double textPadding = 15;
  static const double smallerPadding = 8;
}

class AppPI extends StatelessWidget {
  const AppPI({
    super.key,
    required this.itemTitle,
    required this.tagName,
    required this.year,
    this.subTags,
    required this.contentInfo,
    this.otherInfo,
    this.image,
  });

  final String itemTitle;
  final String tagName;
  final String year;
  final List<String>? subTags;
  final String contentInfo;
  final String? otherInfo;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Paddings.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (image != null)
            Image(
              image: image!,
            ),
          const SizedBox(height: _InternalValues.titleMargin),
          Text(
            itemTitle,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: AppFontSize.h1,
            ),
          ),
          const SizedBox(height: _InternalValues.textPadding),
          AppChip.filled(
            label: tagName,
            year: year,
          ),
          const SizedBox(height: _InternalValues.smallerPadding),
          if (subTags != null)
            SizedBox(
              height: 40,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: subTags!
                      .map(
                        (tag) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: AppChip.outlined(
                            label: tag,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          const SizedBox(height: _InternalValues.textPadding),
          Text(
            contentInfo,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: AppFontSize.body,
            ),
          ),
          if (otherInfo != null)
            Padding(
              padding: const EdgeInsets.only(top: _InternalValues.textPadding),
              child: Text(
                otherInfo!,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: AppFontSize.small,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
