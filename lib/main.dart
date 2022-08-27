import 'package:flutter/material.dart';
import 'package:movies_1/widgets/toprated.dart';
import 'package:movies_1/widgets/trending.dart';
import 'package:movies_1/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = 'e0235252a08307e12e2b1bf720af41df';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMDIzNTI1MmEwODMwN2UxMmUyYjFiZjcyMGFmNDFkZiIsInN1YiI6IjYzMDhlZGU3ZTE4Yjk3MDA3ZWQwYWRjMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BSykySI-yqj_8W4rfJ4J8wqYkox88I_I-qvGLRA8rOs';
  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    TMDB tmdbwithcostumelogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbwithcostumelogs.v3.trending.getTrending();
    Map topratedresult = await tmdbwithcostumelogs.v3.movies.getTopRated();
    Map tvresult = await tmdbwithcostumelogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(topratedmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            TV(tv: tv),
            TopRated(toprated: topratedmovies),
            TrendingMovies(trindingMovies: trendingMovies),
          ],
        ),
      ),
    );
  }
}
