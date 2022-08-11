import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movieappsecond/home/movie.dart';

//Second Screen
class modified_text extends StatefulWidget {
  final String text;
  final Color color;
  final double size;

  const modified_text(
      {Key? key, required this.text, required this.color, required this.size})
      : super(key: key);

  @override
  State<modified_text> createState() => _modified_textState();
}

class _modified_textState extends State<modified_text> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: TextStyle(color: widget.color, fontSize: widget.size));
  }
}

class Moviedescibe extends StatelessWidget {
  final Results? movie;
  const Moviedescibe({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    String? decri = movie?.overview;
    double? vote = movie?.voteAverage;

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: [
        SizedBox(
            height: 250,
            child: Stack(children: [
              Positioned(
                child: SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    movie!.fullImageurl(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  child: modified_text(
                    text: '⭐ Average Rating - ${vote!}',
                    color: const Color.fromARGB(255, 242, 235, 235),
                    size: 20,
                  )),
            ])),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(10),
        ),
        Container(
            padding: const EdgeInsets.only(left: 10),
            child: modified_text(
              text: 'Releasing On - ${movie?.releaseDate}',
              size: 14,
              color: const Color.fromARGB(255, 248, 248, 248),
            )),
        Row(
          children: [
            Flexible(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: modified_text(
                    text: decri!,
                    size: 18,
                    color: Colors.white,
                  )),
            ),
          ],
        )
      ]),
    );
  }
}
