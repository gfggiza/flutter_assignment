import 'package:assignment/services/watchmode_client.dart';
import 'package:flutter/material.dart';
import '../api/gen/watchmode_api.models.swagger.dart';

const String subscription = 'sub';
const String free = 'free';
const String purchase = 'purchase';
const String tve = 'tve';
const String other = 'other';

String sourceType(String type) {
  switch (type) {
    case subscription:
      return 'Subscription service';
    case free:
      return 'Free';
    case purchase:
      return 'Purchase';
    case tve:
      return 'TV channel';
    case other:
      return 'Other';
    default:
      return 'Other';
  }
}

class SourcesService {
  Future<List<SourceSummary>> getSources() async {
    try {
      final response = await watchmodeClient.sourcesGet();
      if (!response.isSuccessful) {
        throw Exception('Failed to load sources: ${response.statusCode}');
      }
      return response.body ?? [];
    } catch (e) {
      debugPrint('Error fetching sources: $e');
      rethrow;
    }
  }

// Alternative using enums
  // List<SourceSummary> getSourcesByEnum(
  //     List<SourceSummary> sources, SourceType type) {
  //   return sources.where((source) => source.type == type).toList();
  // }
}
