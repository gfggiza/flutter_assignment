import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/features/titleslist/data/titleslist_service.dart';
import 'package:assignment/features/titleslist/titleslist_cubit.dart';
import 'package:assignment/navigation/router.dart';
import 'package:assignment/ui/appui.dart';
import 'package:assignment/utils/base_resourcestate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TitlesListPage extends StatelessWidget {
  const TitlesListPage({
    super.key,
    required this.source,
  });

  final SourceSummary source;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TitlesListCubit(
        context.read<TitlesService>(),
      )..loadTitles(source),
      child: TitlesListView(source: source),
    );
  }
}

class TitlesListView extends StatelessWidget {
  const TitlesListView({
    super.key,
    required this.source,
  });

  final SourceSummary source;
  static const double _imgSize = 40;

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.textColor,
        ),
        onPressed: context.pop,
      ),
      title: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage(source.logo100px),
            width: _imgSize,
            height: _imgSize,
          ),
          Flexible(
            child: Text(
              source.name,
              style: const TextStyle(color: AppColors.textColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<TitleSummary> titles, BuildContext context) {
    return Column(
      spacing: 15,
      children: titles
          .map(
            (entry) => AppListItem(
              onPressed: () => context.push(
                AppRoutes.details,
                extra: entry.id,
              ),
              itemTitle: entry.title,
              chipName: getSourceTypeName(entry.type),
              year: entry.year.toString(),
              chip: const AppChip(),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(context),
      body: BlocBuilder<TitlesListCubit, BaseResourceState<List<TitleSummary>>>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const SizedBox.shrink(),
            loading: (_) => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableText(error.error ?? 'An error occurred'),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<TitlesListCubit>().loadTitles(source),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
            success: (state) {
              final titles = state.data ?? [];
              if (titles.isEmpty) {
                return const Center(
                  child: Text(
                    'No content available',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                );
              }

              return SingleChildScrollView(
                child: _buildList(titles, context),
              );
            },
          );
        },
      ),
    );
  }
}
