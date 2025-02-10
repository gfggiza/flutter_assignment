import 'package:assignment/api/gen/watchmode_api.enums.swagger.dart';
import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/ui/appui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final List<String> _subTagsList = [
  'Sub Tag 1',
  'Sub Tag 2',
  'Sub Tag 3',
  'Sub Tag 4',
  'Sub Tag 5',
  'Sub Tag 6',
  'Sub Tag 7',
  'Sub Tag 8',
];

final List<SourceSummary> _sourceSummaryTestList = [
  const SourceSummary(
    id: 1,
    name: 'Item 1',
    type: SourceType.purchase,
    logo100px: 'logo1.png',
    regions: ['Region 1'],
  ),
  const SourceSummary(
    id: 2,
    name: 'Item 2',
    type: SourceType.free,
    logo100px: 'logo2.png',
    regions: ['Region 2'],
  ),
  const SourceSummary(
    id: 3,
    name: 'Item 3',
    type: SourceType.purchase,
    logo100px: 'logo3.png',
    regions: ['Region 3'],
  ),
];

class WidgetsTestPage extends StatelessWidget {
  const WidgetsTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 20,
        children: [
          const AppListItem(
            itemTitle: 'List Title',
            year: 'Year',
          ),
          const AppListItem(
            itemTitle: 'List Title',
            year: 'Year',
          ),
          const AppPI(
            itemTitle: 'PI Item Title',
            type: 'Main Tag',
            year: 'Year',
            contentInfo: 'Content Info',
            otherInfo: 'Other Info',
          ),
          const AppChip(
            label: 'Chip Title',
          ),
          AppPI(
            itemTitle: 'Item Title',
            type: 'Type',
            year: 'Year',
            contentInfo: 'Content Info',
            subTags: _subTagsList,
          ),
          AppCarouselSlider(
            carouselTitle: 'Carousel Title',
            items: _sourceSummaryTestList,
            onPressed: (index) {
              if (kDebugMode) {
                print('Carousel Item $index');
              }
            },
          ),
        ],
      ),
    );
  }
}
