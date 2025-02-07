import 'package:assignment/ui/appui.dart';
import 'package:flutter/material.dart';

final List<String> subTagsList = [
  'Sub Tag 1',
  'Sub Tag 2',
  'Sub Tag 3',
  'Sub Tag 4',
  'Sub Tag 5',
  'Sub Tag 6',
  'Sub Tag 7',
  'Sub Tag 8',
];

class WidgetsTestPage extends StatelessWidget {
  const WidgetsTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        spacing: 20,
        children: [
          AppListItem(
            itemTitle: 'List Title',
            year: 'Year',
          ),
          AppListItem(
            itemTitle: 'List Title',
            year: 'Year',
          ),
          AppListItem(
            itemTitle: 'List Title',
            year: 'Year',
          ),
          AppPI(
            itemTitle: 'PI Item Title',
            tagName: 'Main Tag',
            year: 'Year',
            contentInfo: 'Content Info',
            otherInfo: 'Other Info',
          ),
        ],
      ),
    );
  }
}
