import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp_persistence/persistance/hive_constants.dart';
import "package:movieapp_persistence/data/vos/collection_vo.dart";
import "package:movieapp_persistence/data/vos/genre_vo.dart";
import "package:movieapp_persistence/data/vos/production_company_vo.dart";
import "package:movieapp_persistence/data/vos/production_country_vo.dart";
import "package:movieapp_persistence/data/vos/spoken_language_vo.dart";
import 'package:hive/hive.dart';


//To generate file name
part 'movie_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_MOIVE_VO,adapterName: "MovieVOAdapter")
class MovieVO{
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "backdrop_path")
  @HiveField(1)
  String? backdropPath;

  @JsonKey(name: "genre_ids")
  @HiveField(2)
  List<int>? genreIds;

  @JsonKey(name: "id")
  @HiveField(3)
  int? id;

  @JsonKey(name: "original_language")
  @HiveField(4)
  String? originalLanguage;

  @JsonKey(name: "original_title")
  @HiveField(5)
  String? originalTitle;

  @JsonKey(name: "overview")
  @HiveField(6)
  String? overview;

  @JsonKey(name: "popularity")
  @HiveField(7)
  double? popularity;

  @JsonKey(name: "poster_path")
  @HiveField(8)
  String? posterPath;

  @JsonKey(name: "release_date")
  @HiveField(9)
  String? releaseDate;

  @JsonKey(name: "title")
  @HiveField(10)
  String? title;

  @JsonKey(name: "video")
  @HiveField(11)
  bool? video;

  @JsonKey(name: "vote_average")
  @HiveField(12)
  double? voteAverage;

  @JsonKey(name: "vote_count")
  @HiveField(13)
  int? voteCount;

  @JsonKey(name: "belongs_to_collection")
  @HiveField(14)
  CollectionVO? belongToCollection;

  @JsonKey(name: "budget")
  @HiveField(15)
  double? budget;

  @JsonKey(name: "genres")
  @HiveField(16)
  List<GenreVO>? genres;

  @JsonKey(name: "homepage")
  @HiveField(17)
  String? homePage;

  @JsonKey(name: "imdb_id")
  @HiveField(18)
  String? imdbId;

  @JsonKey(name: "production_companies")
  @HiveField(19)
  List<ProductionCompanyVO>? productionCompanies;

  @JsonKey(name: "production_countries")
  @HiveField(20)
  List<ProductionCountryVO>? productionCountries;

  @JsonKey(name: "revenue")
  @HiveField(21)
  double? revenue;

  @JsonKey(name: "runtime")
  @HiveField(22)
  int? runtime;

  @JsonKey(name: "spoken_languages")
  @HiveField(23)
  List<SpokenLanguageVO>? spokenLanguages;

  @JsonKey(name: "status")
  @HiveField(24)
  String? status;

  @JsonKey(name: "tagline")
  @HiveField(25)
  String? tagLine;

  @HiveField(26)
  bool? isNowPlaying;

  @HiveField(27)
  bool? isPopular;

  @HiveField(28)
  bool? isTopRated;


  MovieVO(
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.belongToCollection,
      this.budget,
      this.genres,
      this.homePage,
      this.imdbId,
      this.productionCompanies,
      this.productionCountries,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagLine,
      this.isPopular,
      this.isNowPlaying,
      this.isTopRated);

  //Network data to VO
  factory MovieVO.fromJson(Map<String, dynamic> json) => _$MovieVOFromJson(json);

  //Reusable component
  List<String> getGenreListAsStingList(){
    return genres?.map((genre) => genre.name ?? "").toList() ?? [];
  }

  String getGenreListAsCommaSeparatedString(){
    return genres?.map((genre) => genre.name ?? "")
        .toList()
        .join(",") ?? "";
  }

  String getMovieLength()  {
    var d = Duration(minutes: runtime ?? 0);
    List<String> parts = d.toString().split(':');
    return '${parts[0]} hr ${parts[1].padLeft(2, '0')} mins';
 }
  String getProductionCountiesAsCommaSeperatedString(){
    return productionCountries?.map((country) => country.name?? "")
        .toList()
        .join(",") ?? "";
  }


  //VO to Json
  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  @override
  String toString() {
    return 'MovieVO{adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount, belongToCollection: $belongToCollection, budget: $budget, genres: $genres, homePage: $homePage, imdbId: $imdbId, productionCompanies: $productionCompanies, productionCountries: $productionCountries, revenue: $revenue, runtime: $runtime, spokenLanguages: $spokenLanguages, status: $status, tagLine: $tagLine, isNowPlaying: $isNowPlaying, isPopular: $isPopular, isTopRated: $isTopRated}';
  }
}