import 'package:flutter/material.dart';

class Discription extends StatelessWidget {
  final String name, discription, bannerurl, posterurl, vote, launch_on;

  const Discription(
      {super.key,
      required this.name,
      required this.discription,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(children: [
          Container(
            height: 250,
            child: Stack(children: [
              Positioned(
                child: Container(
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  ),
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Text(' ⭐ Average Rating: ' + vote),
              ),
            ]),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              name != null ? name : 'No title',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text('Releasing On - ' + launch_on),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            color: Color.fromARGB(161, 194, 187, 187),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  height: 200,
                  width: 150,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      discription,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
