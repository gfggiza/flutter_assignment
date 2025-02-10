import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/features/details/data/details_service.dart';
import 'package:assignment/features/details/details_cubit.dart';
import 'package:assignment/ui/appui.dart';
import 'package:assignment/utils/base_resourcestate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.titleId,
  });

  final int titleId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(
        context.read<DetailsService>(),
      )..loadDetails(titleId),
      child: DetailsView(titleId: titleId),
    );
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({
    super.key,
    required this.titleId,
  });

  final int titleId;

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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(context),
      body: BlocBuilder<DetailsCubit, BaseResourceState<List<TitleDetails>>>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const SizedBox.shrink(),
            loading: (_) => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableText(
                    error.error ?? 'An error occurred',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<DetailsCubit>().loadDetails(titleId),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
            success: (state) {
              final details = state.data;
              if (details == null || details.isEmpty) {
                return const Center(
                  child: Text(
                    'No details available',
                    style: TextStyle(color: AppColors.textColor),
                  ),
                );
              }

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: AppPI(
                      image: NetworkImage(details[0].poster),
                      itemTitle: details[0].title,
                      type: getSourceTypeName(details[0].type),
                      year: details[0].year.toString(),
                      subTags: details[0].genreNames,
                      contentInfo: details[0].plotOverview,
                      otherInfo: details[0].relevancePercentile.toString(),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
