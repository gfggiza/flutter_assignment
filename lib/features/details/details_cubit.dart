import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
import 'package:assignment/features/details/data/details_service.dart';
import 'package:assignment/utils/base_resourcestate_cubit.dart';

class DetailsCubit extends BaseResourceCubit<List<TitleDetails>> {
  DetailsCubit(this._repository) : super();

  final DetailsService _repository;

  Future<void> loadDetails(int titleId) => executeRequest(
        () => _repository.getDetails(titleId),
      );
}
