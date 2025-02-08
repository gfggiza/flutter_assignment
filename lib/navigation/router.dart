import 'package:assignment/api/gen/watchmode_api.models.swagger.dart' as gen;
import 'package:assignment/features/details/details_page.dart';
import 'package:assignment/features/sources/sources_page.dart';
import 'package:assignment/features/titleslist/titleslist_page.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String home = '/';
  static const String sources = '/sources';
  static const String listTitles = '/list_titles';
  static const String details = '/details';
}

final appRouter = GoRouter(
  initialLocation: '/sources',
  routes: [
    GoRoute(
      path: AppRoutes.sources,
      builder: (context, state) => const SourcesPage(),
    ),
    GoRoute(
      path: AppRoutes.listTitles,
      builder: (context, state) {
        // print('Navigating to ListTitles with data: ${state.extra}');
        final source =
            state.extra! as gen.SourceSummary; // Remove forced unwrap
        return TitlesListPage(source: source); // Pass nullable source
      },
    ),
    GoRoute(
      path: AppRoutes.details,
      builder: (context, state) {
        final id = state.extra! as int; // Remove forced unwrap
        return DetailsPage(titleId: id);
      },
    ),
  ],
);
