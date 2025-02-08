import 'package:assignment/api/gen/watchmode_api.swagger.dart';

class SourcesService {
  const SourcesService(this._api);

  final WatchmodeApi _api;

  Future<List<SourceSummary>> getSources() async {
    final response = await _api.sourcesGet();

    if (!response.isSuccessful) {
      throw Exception('Failed to load sources: ${response.error}');
    }

    return response.body ?? [];
  }
}
