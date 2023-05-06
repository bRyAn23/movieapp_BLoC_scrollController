// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_credits_by_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCreditByMovieReponse _$GetCreditByMovieReponseFromJson(
        Map<String, dynamic> json) =>
    GetCreditByMovieReponse(
      json['id'] as int?,
      (json['cast'] as List<dynamic>?)
          ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCreditByMovieReponseToJson(
        GetCreditByMovieReponse instance) =>
    <String, dynamic>{
      'id': instance.Id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
