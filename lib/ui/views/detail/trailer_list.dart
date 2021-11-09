import 'package:flutter/material.dart';
import 'package:movies/domain/models/movie_detail.dart';

import '../../../colours.dart';
import '../../../dimens.dart';

class TrailerList extends StatelessWidget {
  final List<Trailer> trailers;

  TrailerList(this.trailers);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      child: ListView.builder(
          padding: EdgeInsets.only(right: margin, top: margin, bottom: margin),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: trailers.length,
          itemBuilder: (BuildContext context, int index) {
            Trailer trailer = trailers[index];
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: margin),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: primaryColourShadow4,
                            blurRadius: blurRadius,
                            spreadRadius: spreadRadius)
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(trailer.thumbnail),
                      ),
                    )
                ),
                Container(
                  width: 72.0,
                  height: 72.0,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: whiteHalfTransparent),
                ),
                Icon(Icons.play_arrow, color: primaryColour, size: trailerPlayArrow),
              ],
            );
          }),
    );
  }
}
