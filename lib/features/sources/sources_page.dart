import 'package:assignment/api/gen/watchmode_api.enums.swagger.dart';
import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/features/sources/data/source_service.dart';
import 'package:assignment/features/sources/sources_cubit.dart';
import 'package:assignment/ui/appui.dart';
import 'package:assignment/utils/base_resourcestate_cubit.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../navigation/router.dart';

class SourcesPage extends StatelessWidget {
  const SourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SourcesCubit(
        context.watch<SourcesService>(),
      )..loadSources(),
      child: const SourcesView(),
    );
  }
}

class SourcesView extends StatelessWidget {
  const SourcesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<SourcesCubit, BaseResourceState<List<SourceSummary>>>(
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loading: (_) => const Center(child: CircularProgressIndicator()),
            error: (err) => Center(
              child: SelectableText(
                err.error ?? 'An error occurred',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            success: (state) {
              final sourcesByType = groupBy(
                state.data ?? [],
                (source) => (source as dynamic).type,
              );

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Sources',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: AppFontSize.h2,
                        ),
                      ),
                    ),
                    ...sourcesByType.entries.map(
                      (entry) => AppCarouselSlider(
                        carouselTitle: sourceType(
                          (entry.key as SourceType).value.toString(),
                        ),
                        items: entry.value.cast<SourceSummary>(),
                        onPressed: (item) => context.push(
                          AppRoutes.listTitles,
                          extra: item,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
