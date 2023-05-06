import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp_persistence/data/vos/actor_vo.dart';
part 'get_credits_by_movie_response.g.dart';

@JsonSerializable()
class GetCreditByMovieReponse{

  @JsonKey(name: "id")
  int? Id;

  @JsonKey(name: "cast")
  List<ActorVO>? cast;

  @JsonKey(name: "crew")
  List<ActorVO>? crew;


  GetCreditByMovieReponse(this.Id, this.cast, this.crew);

  //Network data to VO
  factory GetCreditByMovieReponse.fromJson(Map<String, dynamic> json)
  => _$GetCreditByMovieReponseFromJson(json);

  //VO to Json
  Map<String, dynamic> toJson() => _$GetCreditByMovieReponseToJson(this);

}