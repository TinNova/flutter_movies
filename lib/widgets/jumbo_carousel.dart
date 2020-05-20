import 'package:flutter/material.dart';
import 'package:movies/dimens.dart';
import 'package:movies/models/movie_theatre.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../colours.dart';

class JumboCarousel extends StatelessWidget {
  final GlobalKey<ScrollSnapListState> sslKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 227.0, // i don't like this number, we need a wrap content instead 195.0, 217.0, 198.0
      child: ScrollSnapList(
        itemBuilder: _buildListItem,
        itemSize: 365.0,
        itemCount: movies.length,
        key: sslKey,
        margin: EdgeInsets.all(0.0),
        initialIndex: (movies.length / 2).floorToDouble(),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    MovieTheatre movie = movies[index];
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () {
            sslKey.currentState.focusToItem(index);
          },
          child: Card(
            elevation: 3,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
            margin: EdgeInsets.only(left: 7.5, top: 15, right: 7.5, bottom: 15),
            borderOnForeground: false,
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(movie.imageUrl)),
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [BoxShadow(color: primaryColourShadow4, blurRadius: blurRadius, spreadRadius: spreadRadius)],
              ),
            ),
          ),
        ),
        Positioned(
          right: 20.0,
          bottom: 16.0,
          child: Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
