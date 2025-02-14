import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/features/titleslist/data/titleslist_service.dart';
import 'package:assignment/utils/base_resourcestate_cubit.dart';

class TitlesListCubit extends BaseResourceCubit<List<TitleSummary>> {
  TitlesListCubit(this._repository) : super();
  final TitlesService _repository;

  Future<void> loadTitles(SourceSummary source) => executeRequest(
        () => _repository.getTitlesList(source),
      );
}
