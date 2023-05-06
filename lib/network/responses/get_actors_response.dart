import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp_persistence/data/vos/actor_vo.dart';
part 'get_actors_response.g.dart';

@JsonSerializable()
class GetActorsResponse{

  @JsonKey(name: "results")
  List<ActorVO>? results;

  GetActorsResponse(
  this.results
  );

  //Network data to VO
  factory GetActorsResponse.fromJson(Map<String, dynamic> json)
  => _$GetActorsResponseFromJson(json);

  //VO to Json
  Map<String, dynamic> toJson() => _$GetActorsResponseToJson(this);

}