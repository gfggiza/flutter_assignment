import 'package:assignment/api/gen/watchmode_api.enums.swagger.dart';
import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/navigation/routes.dart';
import 'package:assignment/services/sources_service.dart';
import 'package:assignment/ui/appui.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SourcesPage extends StatefulWidget {
  const SourcesPage({super.key}); // Add const constructor

  @override
  State<SourcesPage> createState() =>
      _SourcesPageState(); // Fix state class name
}

class _SourcesPageState extends State<SourcesPage> {
  final _sourcesService = SourcesService();
  Map<SourceType, List<SourceSummary>> _sourcesByType = {};
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadSources();
    //print(_sourcesByType);
  }

  Future<void> _loadSources() async {
    try {
      setState(() => _isLoading = true);
      final sources = await _sourcesService.getSources();
      final sourcesByType = groupBy(sources, (source) => source.type);
      setState(() {
        _sourcesByType = sourcesByType;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Sources',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: AppFontSize.h2,
                          ),
                        ),
                      ),
                      ..._sourcesByType.entries.map(
                        (entry) => AppCarouselSlider(
                          carouselTitle: sourceType(
                            entry.key.value.toString(),
                          ),
                          items: entry.value,
                          onPressed: (item) => context.push(
                            AppRoutes.listTitles,
                            extra: item, // Pass the selected item data
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
