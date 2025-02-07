import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/services/watchmode_client.dart';
import 'package:flutter/material.dart';

class TitleSummaryService {
  Future<List<TitleSummary>> getTitlesResult(SourceSummary source) async {
    try {
      final response = await watchmodeClient.listTitlesGet(
        sourceIds: source.id.toString(),
        limit: 10,
        page: 1,
      );
      if (!response.isSuccessful) {
        throw Exception(
          'Failed to load titles summary list: ${response.error}',
        );
      }
      if (response.body == null) {
        return [];
      }

      // ! This response returns a TitlesResult object hence why cast was necessary
      final titles = response.body!.titles;
      return titles.cast<TitleSummary>().toList();
    } catch (err) {
      debugPrint('Error fetching title summary: $err');
      rethrow;
    }
  }
}
