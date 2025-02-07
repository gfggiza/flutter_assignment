import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/services/watchmode_client.dart';
import 'package:flutter/material.dart';

class TitleDetailsService {
  Future<List<TitleDetails>> getSources(int id) async {
    try {
      final response =
          await watchmodeClient.titleTitleIdDetailsGet(titleId: id);
      if (!response.isSuccessful) {
        throw Exception('Failed to load details: ${response.statusCode}');
      }
      final details = response.body!;
      return [details];
    } catch (e) {
      debugPrint('Error fetching sources: $e');
      rethrow;
    }
  }
}
