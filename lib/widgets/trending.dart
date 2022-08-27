import 'package:flutter/material.dart';
import 'package:movies_1/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trindingMovies;

  const TrendingMovies({super.key, required this.trindingMovies});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending Movies',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trindingMovies.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Discription(
                            name: trindingMovies[index]['title'],
                            discription: trindingMovies[index]['overview'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                trindingMovies[index]['backdrop_path'],
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                trindingMovies[index]['poster_path'],
                            vote: trindingMovies[index]['vote_average']
                                .toString(),
                            launch_on: trindingMovies[index]['release_date']
                                .toString(),
                          ),
                        ),
                      );
                    },
                    child: trindingMovies[index]['title'] != null
                        ? Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trindingMovies[index]
                                                ['poster_path'],
                                      ),
                                    ),
                                    //+trending[index
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  child: Text(
                                      trindingMovies[index]['title'] != null
                                          ? trindingMovies[index]['title']
                                          : 'No title found'),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
