import 'package:flutter/material.dart';
import 'package:movies/models/movie_theatre.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../colours.dart';

class JumboCarousel extends StatelessWidget {
  final GlobalKey<ScrollSnapListState> sslKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 212.0, // i don't like this number, we need a wrap content instead 195.0, 217.0, 198.0
      child: ScrollSnapList(
        itemSize: 365.0,
        itemBuilder: _buildListItem,
        itemCount: movies.length,
        key: sslKey,
        initialIndex: (movies.length / 2).floorToDouble(),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    MovieTheatre movie = movies[index];
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [BoxShadow(color: primaryColourShadow2, blurRadius: 7, spreadRadius: 2.0)],
      ),
      margin: EdgeInsets.only(left: 7.5, top: 7.5, right: 7.5, bottom: 7.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            InkWell(
              child: Image(
                image: AssetImage(movie.imageUrl),
                fit: BoxFit.fitWidth,
              ),
              onTap: () {
                sslKey.currentState.focusToItem(index);
              },
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
        ),
      ),
    );
  }
}
