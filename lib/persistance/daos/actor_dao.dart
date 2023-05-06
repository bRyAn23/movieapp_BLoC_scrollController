import 'package:hive/hive.dart';
import 'package:movieapp_persistence/persistance/hive_constants.dart';
import 'package:movieapp_persistence/data/vos/actor_vo.dart';

class ActorDao{

  //Singleton Set Up
  static final ActorDao _singleton = ActorDao._internal();

  factory ActorDao(){
    return _singleton;
  }

  ActorDao._internal();

  //Open Box
  Box<ActorVO> getActorBox(){
    return Hive.box<ActorVO>(BOX_NAME_ACTOR_VO);
  }

  //SaveAllActor
  void saveAllActors(List<ActorVO> actorList) async{
    //User Iterable VO List(convert List to Map FIRST)
    // to VO with save with key and object
    Map<int,ActorVO> actorMap = Map.fromIterable(actorList,
        key : (actor) => actor.id,value: (actor) => actor);
    await getActorBox().putAll(actorMap);
    // insert single data getActorBox().put(actorMap); putAll use for bulk insert
  }

  //getAllActor
  List<ActorVO> getAllActors(){
    return getActorBox().values.toList();
  }
}