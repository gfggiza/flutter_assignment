import 'package:assignment/api/watchmode_api.dart';
import 'package:assignment/configuration/config.dart';

final watchmodeClient = createWatchmodeApi(
  baseUrl: config.watchmodeBaseUrl,
  apiKey: config.watchmodeApiKey,
);
