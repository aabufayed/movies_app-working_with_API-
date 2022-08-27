import 'package:flutter/material.dart';
import 'package:movies_1/description.dart';
import 'package:movies_1/main.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({super.key, required this.tv});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TV shows',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Discription(
                                  name: tv[index]['name'],
                                  discription: tv[index]['overview'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      tv[index]['poster_path'],
                                  vote: tv[index]['vote_average'].toString(),
                                  launch_on:
                                      tv[index]['first_air_date'].toString())));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        tv[index]['poster_path'],
                                  ),
                                  fit: BoxFit.cover),
                              //+trending[index
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            child: Text(tv[index]['original_name'] != null
                                ? tv[index]['original_name']
                                : 'No title found'),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
