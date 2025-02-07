import 'package:assignment/api/gen/watchmode_api.enums.swagger.dart';

String getSourceTypeName(TitleType? type) {
  switch (type) {
    case TitleType.movie:
      return 'Movie';
    case TitleType.tvSeries:
      return 'TV Series';
    case TitleType.tvSpecial:
      return 'TV Special';
    case TitleType.tvMiniseries:
      return 'TV Miniseries';
    case TitleType.shortFilm:
      return 'Short Film';
    default:
      return 'Unknown';
  }
}
