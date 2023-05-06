import 'package:hive/hive.dart';
import 'package:movieapp_persistence/data/vos/genre_vo.dart';
import 'package:movieapp_persistence/persistance/hive_constants.dart';
class GenreDao{

  //Singleton Set Up
  static final GenreDao _singleton = GenreDao._internal();

  factory GenreDao(){
    return _singleton;
  }

  GenreDao._internal();

  //Open Box
  Box<GenreVO> getGenreBox(){
    return Hive.box<GenreVO>(BOX_NAME_GENRE_VO);
  }

  //SaveAllActor
  void saveAllGenres(List<GenreVO> genreList) async{
    //User Iterable VO List(convert List to Map FIRST)
    // to VO with save with key and object
    Map<int,GenreVO> genreMap = Map.fromIterable(genreList,
        key : (genre) => genre.id,value: (genre) => genre);
    await getGenreBox().putAll(genreMap);
    // insert single data getActorBox().put(actorMap); putAll use for bulk insert
  }

  //getAllActor
  List<GenreVO> getAllGenres(){
    return getGenreBox().values.toList();
  }
}