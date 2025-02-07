import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/services/details_service.dart';
import 'package:assignment/ui/enums/sourcetype_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/appui.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.titleId,
  });

  final int titleId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _detailsService = TitleDetailsService();
  List<TitleDetails> _details = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _detailsList();
  }

  Future<void> _detailsList() async {
    try {
      setState(() => _isLoading = true);
      final result = await _detailsService.getSources(widget.titleId);
      setState(() {
        _details = result;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back, // Changed to iOS style back arrow
          color: AppColors.textColor, // Match text color
        ),
        onPressed: context.pop,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(context),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: SelectableText(_error!))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: AppPI(
                        image: NetworkImage(_details[0].poster),
                        itemTitle: _details[0].title,
                        type: getSourceTypeName(_details[0].type),
                        year: _details[0].year.toString(),
                        subTags: _details[0].genreNames,
                        contentInfo: _details[0].plotOverview,
                        otherInfo: _details[0].relevancePercentile.toString(),
                      ),
                    ),
                  ),
                ),
    );
  }
}
