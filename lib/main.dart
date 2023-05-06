import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp_persistence/data/vos/actor_vo.dart';
import 'package:movieapp_persistence/data/vos/collection_vo.dart';
import 'package:movieapp_persistence/data/vos/date_vo.dart';
import 'package:movieapp_persistence/data/vos/genre_vo.dart';
import 'package:movieapp_persistence/data/vos/movie_vo.dart';
import 'package:movieapp_persistence/data/vos/production_company_vo.dart';
import 'package:movieapp_persistence/data/vos/production_country_vo.dart';
import 'package:movieapp_persistence/data/vos/spoken_language_vo.dart';
import 'package:movieapp_persistence/network/dataagents/dio_move_data_agent_impl.dart';
import 'package:movieapp_persistence/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:movieapp_persistence/persistance/hive_constants.dart';
import 'pages/home_page.dart';

void main() async{
  //Initialized Hive
  await Hive.initFlutter();

  //Register VO Adapter
  Hive.registerAdapter(ActorVOAdapter());
  Hive.registerAdapter(CollectionVOAdapter());
  Hive.registerAdapter(DateVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(ProductionCompanyVOAdapter());
  Hive.registerAdapter(ProductionCountryVOAdapter());
  Hive.registerAdapter(SpokenLanguageVOAdapter());

  //BoxOpen
  await Hive.openBox<ActorVO>(BOX_NAME_ACTOR_VO);
  await Hive.openBox<MovieVO>(BOX_NAME_MOIVE_VO);
  await Hive.openBox<GenreVO>(BOX_NAME_GENRE_VO);

  //HttpMovieDataAgentImpl().getNowPlayingMovies(1);
  //DioMovieDataAgentImpl().getNowPlayingMovies(1);
  //RetrofitDataAgentImpl().getNowPlayingMovies(1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

