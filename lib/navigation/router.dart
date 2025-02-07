import 'package:assignment/api/gen/watchmode_api.models.swagger.dart' as gen;
import 'package:assignment/navigation/routes.dart';
import 'package:assignment/pages/details.dart';
import 'package:assignment/pages/home.dart';
import 'package:assignment/pages/list_titles.dart';
import 'package:assignment/pages/sources.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/sources',
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
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
        return ListTitlesPage(source: source); // Pass nullable source
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
