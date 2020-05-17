import 'package:flutter/material.dart';
import 'package:movies/colours.dart';
import 'package:movies/models/movie_poster.dart';
import 'package:movies/widgets/grid_list.dart';
import 'package:movies/widgets/text_widgets.dart';
import 'dimens.dart';
import 'widgets/jumbo_carousel.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'main_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: TitleMedium('In Theatres Now'),
              padding: EdgeInsets.all(15.0),
            ),
            JumboCarousel(),
            Container(
              margin: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(flex: 1, child: Container(child: TitleMedium('Latest'))),
                  Expanded(flex: 1, child: Container(child: TitleMedium('Top rated'))),
                  Expanded(flex: 1, child: Container(child: TitleMedium('Popular'))),
                ],
              ),
            ),
            GridList()
          ],
        ),
      ),
    );
  }
}
