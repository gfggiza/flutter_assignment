import 'package:assignment/api/gen/watchmode_api.swagger.dart';

class TitlesService {
  const TitlesService(this._api);

  final WatchmodeApi _api;

  Future<List<TitleSummary>> getTitlesList(SourceSummary source) async {
    final response = await _api.listTitlesGet(
      sourceIds: source.id.toString(),
      limit: 10,
      page: 1,
    );

    if (!response.isSuccessful) {
      throw Exception('Failed to load titles: ${response.error}');
    }

    return response.body?.titles ?? [];
  }
}
