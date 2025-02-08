import 'package:assignment/api/gen/watchmode_api.swagger.dart';
import 'package:assignment/api/watchmode_api.dart';
import 'package:assignment/configuration/config.dart';
import 'package:assignment/features/details/data/details_service.dart';
import 'package:assignment/features/sources/data/source_service.dart';
import 'package:assignment/features/titleslist/data/titleslist_service.dart';
import 'package:assignment/navigation/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<WatchmodeApi>(
          create: (_) => createWatchmodeApi(
            baseUrl: config.watchmodeBaseUrl,
            apiKey: config.watchmodeApiKey,
          ),
        ),
        Provider<SourcesService>(
          create: (context) => SourcesService(
            context.read<WatchmodeApi>(),
          ),
        ),
        Provider<TitlesService>(
          create: (context) => TitlesService(
            context.read<WatchmodeApi>(),
          ),
        ),
        Provider<DetailsService>(
          create: (context) => DetailsService(
            context.read<WatchmodeApi>(),
          ),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Assignment',
      routerConfig: appRouter,
    );
  }
}
