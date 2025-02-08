import 'package:assignment/api/gen/watchmode_api.enums.swagger.dart';

String getSourceTypeName(dynamic type) {
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

const String subscription = 'sub';
const String free = 'free';
const String purchase = 'purchase';
const String tve = 'tve';
const String other = 'other';

String sourceType(String type) {
  switch (type) {
    case subscription:
      return 'Subscription service';
    case free:
      return 'Free';
    case purchase:
      return 'Purchase';
    case tve:
      return 'TV channel';
    case other:
      return 'Other';
    default:
      return 'Other';
  }
}
