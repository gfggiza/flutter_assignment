import 'package:assignment/api/gen/watchmode_api.swagger.dart';

class DetailsService {
  const DetailsService(this._api);

  final WatchmodeApi _api;

  Future<List<TitleDetails>> getDetails(int titleId) async {
    final response = await _api.titleTitleIdDetailsGet(
      titleId: titleId,
    );

    if (!response.isSuccessful) {
      throw Exception('Failed to load details: ${response.error}');
    }

    final details = response.body!;
    return [details];
  }
}
