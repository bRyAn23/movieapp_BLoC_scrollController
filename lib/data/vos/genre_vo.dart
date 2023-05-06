import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp_persistence/persistance/hive_constants.dart';
//To geneate file name
part 'genre_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_GENRE_VO,adapterName: "GenreVOAdapter")
class GenreVO{
  @JsonKey(name: "id")
  @HiveField(0)
  int? id;
  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  GenreVO(
      this.id,
      this.name);

  //Network data to VO
  factory GenreVO.fromJson(Map<String, dynamic> json) => _$GenreVOFromJson(json);

  //VO to Json
  Map<String, dynamic> toJson() => _$GenreVOToJson(this);

  @override
  String toString() {
    return 'GenreVO{id: $id, name: $name}';
  }
}