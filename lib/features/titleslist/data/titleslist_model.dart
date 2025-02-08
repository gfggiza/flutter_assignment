// import 'dart:convert';

// import 'package:assignment/api/gen/watchmode_api.enums.swagger.dart' as enums;
// import 'package:assignment/api/gen/watchmode_api.models.swagger.dart';
// import 'package:collection/collection.dart';
// import 'package:json_annotation/json_annotation.dart';

// Map<String, dynamic> _$TitleSummaryToJson(TitleSummary instance) =>
//     <String, dynamic>{
//       'id': instance.id,
//       'title': instance.title,
//       'year': instance.year,
//       'type': titleTypeToJson(instance.type),
//     };

// enums.TitleType titleTypeFromJson(
//   Object? titleType, [
//   enums.TitleType? defaultValue,
// ]) {
//   return enums.TitleType.values.firstWhereOrNull((e) => e.value == titleType) ??
//       defaultValue ??
//       enums.TitleType.swaggerGeneratedUnknown;
// }

// @JsonSerializable(explicitToJson: true)
// class TitleSummary {
//   const TitleSummary({
//     required this.id,
//     required this.title,
//     required this.year,
//     required this.type,
//   });

//   factory TitleSummary.fromJson(Map<String, dynamic> json) =>
//         _$TitleSummaryFromJson(json) as TitleSummary;

//   static const toJsonFactory = _$TitleSummaryToJson;
//   Map<String, dynamic> toJson() => _$TitleSummaryToJson(this);

//   @JsonKey(name: 'id')
//   final int id;
//   @JsonKey(name: 'title')
//   final String title;
//   @JsonKey(name: 'year')
//   final int year;
//   @JsonKey(
//     name: 'type',
//     toJson: titleTypeToJson,
//     fromJson: titleTypeFromJson,
//   )
//   final enums.TitleType type;
//   static const fromJsonFactory = _$TitleSummaryFromJson;

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other is TitleSummary &&
//             (identical(other.id, id) ||
//                 const DeepCollectionEquality().equals(other.id, id)) &&
//             (identical(other.title, title) ||
//                 const DeepCollectionEquality().equals(other.title, title)) &&
//             (identical(other.year, year) ||
//                 const DeepCollectionEquality().equals(other.year, year)) &&
//             (identical(other.type, type) ||
//                 const DeepCollectionEquality().equals(other.type, type)));
//   }

//   @override
//   String toString() => jsonEncode(this);

//   @override
//   int get hashCode =>
//       const DeepCollectionEquality().hash(id) ^
//       const DeepCollectionEquality().hash(title) ^
//       const DeepCollectionEquality().hash(year) ^
//       const DeepCollectionEquality().hash(type) ^
//       runtimeType.hashCode;
// }

// class _$TitleSummaryFromJson {
//   _$TitleSummaryFromJson(Map<String, dynamic> json);
// }

// extension $TitleSummaryExtension on TitleSummary {
//   TitleSummary copyWith(
//       {int? id, String? title, int? year, enums.TitleType? type}) {
//     return TitleSummary(
//         id: id ?? this.id,
//         title: title ?? this.title,
//         year: year ?? this.year,
//         type: type ?? this.type);
//   }

//   TitleSummary copyWithWrapped(
//       {Wrapped<int>? id,
//       Wrapped<String>? title,
//       Wrapped<int>? year,
//       Wrapped<enums.TitleType>? type}) {
//     return TitleSummary(
//         id: (id != null ? id.value : this.id),
//         title: (title != null ? title.value : this.title),
//         year: (year != null ? year.value : this.year),
//         type: (type != null ? type.value : this.type));
//   }
// }
