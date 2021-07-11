import 'package:flutter/material.dart';
import 'package:movies/data/models/movie_trailer.dart';

import '../../../colours.dart';
import '../../../dimens.dart';

class TrailerList extends StatelessWidget {
  final List<MDBTrailer> trailers;

  TrailerList(this.trailers);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      child: ListView.builder(
          padding: EdgeInsets.only(right: margin),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: trailers.length,
          itemBuilder: (BuildContext context, int index) {
            MDBTrailer trailer = trailers[index];
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(left: margin),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius),
                      child: Image(
                        fit: BoxFit.scaleDown,
                        image: NetworkImage(trailer.thumbnail),
                      ),
                    )),
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
