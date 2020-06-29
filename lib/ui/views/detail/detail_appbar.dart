import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../colours.dart';
import '../../../dimens.dart';

class DetailAppBar implements SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;

  DetailAppBar({
    this.minExtent,
    this.maxExtent,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          height: 500.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(borderRadius), bottomRight: Radius.circular(borderRadius)),
            image: DecorationImage(image: AssetImage("assets/images/poster_starwars.jpg"), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          child: Opacity(
            opacity: scoreOpacity(shrinkOffset),
            child: Column(children: <Widget>[
              Container(
                width: 72.0,
                height: 72.0,
                margin: EdgeInsets.only(bottom: 24.0),
                decoration: BoxDecoration(shape: BoxShape.circle, color: primaryColour),
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Column(
                    children: <Widget>[
                      Text("8.2", style: GoogleFonts.archivoBlack(fontSize: fontLarge, color: white)),
                      Text("Score", style: GoogleFonts.tenorSans(fontSize: font, color: white))
                    ],
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                Icon(Icons.favorite_border, color: primaryColour),
                SizedBox(width: 24.0),
                Icon(Icons.share, color: primaryColour),
              ]),
            ]),
          ),
          right: marginMedium,
          bottom: marginDetailScreenScore,
        )
      ],
    );
  }

  // Takes the shrinkOffset to calculate the opacity of the score elements
  // We should have one to calculate when the Movie Image should turn to solid purple
  double scoreOpacity(double shrinkOffset) {
//    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
