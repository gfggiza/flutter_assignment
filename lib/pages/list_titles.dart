import 'package:assignment/api/gen/watchmode_api.enums.swagger.dart';
import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/services/titleresults_service.dart';
import 'package:assignment/ui/enums/sourcetype_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../navigation/routes.dart';
import '../ui/appui.dart';

class _InternalValues {
  static const double imgSize = 40;
}

class ListTitlesPage extends StatefulWidget {
  const ListTitlesPage({
    super.key,
    required this.source,
  });
  final SourceSummary source;

  @override
  State<ListTitlesPage> createState() => _ListTitlesPageState();
}

// Widgets To build the Page
class _ListTitlesPageState extends State<ListTitlesPage> {
  final _titlesResultsService = TitleSummaryService();
  List<TitleSummary> _titlesResult = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _titlesResultList();
  }

  Future<void> _titlesResultList() async {
    try {
      setState(() => _isLoading = true);
      final result = await _titlesResultsService.getTitlesResult(widget.source);
      setState(() {
        _titlesResult = result;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    ListTitlesPage widget,
  ) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back, // Changed to iOS style back arrow
          color: AppColors.textColor, // Match text color
        ),
        onPressed: context.pop,
      ),
      title: _buildAppBarTitle(widget),
    );
  }

  Widget _buildAppBarTitle(ListTitlesPage widget) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: NetworkImage(widget.source.logo100px),
          width: _InternalValues.imgSize,
          height: _InternalValues.imgSize,
        ),
        Flexible(
          child: Text(
            widget.source.name,
            style: const TextStyle(color: AppColors.textColor),
          ),
        ),
      ],
    );
  }

  Widget _buildList(BuildContext context) {
    return Column(
      spacing: 15,
      children: _titlesResult
          .map(
            (entry) => AppListItem(
              onPressed: () => context.push(
                AppRoutes.details,
                extra: entry.id, // Pass the selected item data
              ),
              itemTitle: entry.title,
              chipName: getSourceTypeName(entry.type),
              year: entry.year.toString(),
              chip: const AppChip(),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(context, widget),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: SelectableText(_error!))
              : _titlesResult.isEmpty
                  ? const Center(
                      child: Text(
                        'No content available',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      child: _buildList(context),
                    ),
    );
  }
}
