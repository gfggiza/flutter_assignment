import 'package:assignment/api/gen/watchmode_api.swagger.dart';
import 'package:assignment/features/sources/data/source_service.dart';
import 'package:assignment/utils/base_resourcestate_cubit.dart';

class SourcesCubit extends BaseResourceCubit<List<SourceSummary>> {
  SourcesCubit(this._repository) : super();

  final SourcesService _repository;

  Future<void> loadSources() => executeRequest(
        _repository.getSources,
      );
}
