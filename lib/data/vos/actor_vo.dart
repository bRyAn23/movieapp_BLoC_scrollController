import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp_persistence/persistance/hive_constants.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';
import 'package:hive/hive.dart';
import 'package:movieapp_persistence/persistance/hive_constants.dart';

//To geneate file name
part 'actor_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_ACTOR_VO,adapterName: "ActorVOAdapter")
class ActorVO {
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "id")
  @HiveField(1)
  int? id;

  @JsonKey(name: "known_for")
  @HiveField(2)
  List<MovieVO>? knownFor;

  @JsonKey(name: "popularity")
  @HiveField(3)
  double? popularity;

  @JsonKey(name: "name")
  @HiveField(4)
  String? name;

  @JsonKey(name: "profile_path")
  @HiveField(5)
  String? profilePath;

  @JsonKey(name: "gender")
  @HiveField(6)
  int? gender;

  @JsonKey(name: "known_for_department")
  @HiveField(7)
  String? knownForDepartment;

  @JsonKey(name: "original_name")
  @HiveField(8)
  String? originalName;

  @JsonKey(name: "cast_id")
  @HiveField(9)
  int? castId;

  @JsonKey(name: "character")
  @HiveField(10)
  String? character;

  @JsonKey(name: "credit_id")
  @HiveField(11)
  String? creditId;

  @JsonKey(name: "order")
  @HiveField(12)
  int? order;

  ActorVO(
      this.adult,
      this.id,
      this.knownFor,
      this.popularity,
      this.name,
      this.profilePath,
      this.gender,
      this.knownForDepartment,
      this.originalName,
      this.castId,
      this.character,
      this.creditId,
      this.order);

  //Network data to VO
  factory ActorVO.fromJson(Map<String, dynamic> json) => _$ActorVOFromJson(json);

  //VO to Json
  Map<String, dynamic> toJson() => _$ActorVOToJson(this);

}