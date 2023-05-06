import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp_persistence/persistance/hive_constants.dart';
part 'production_country_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_PRODUCTION_COUNTRY_VO,adapterName: "ProductionCountryVOAdapter")
class ProductionCountryVO{

  @JsonKey(name: "iso_3166_1")
  @HiveField(0)
  String? iso_3166_1;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  ProductionCountryVO(this.iso_3166_1, this.name);

  //Network data to VO
  factory ProductionCountryVO.fromJson(Map<String, dynamic> json) => _$ProductionCountryVOFromJson(json);

  //VO to Json
  Map<String, dynamic> toJson() => _$ProductionCountryVOToJson(this);

}