import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/domain/models/movie_detail.dart';
import 'package:movies/ui/views/detail/trailer_list.dart';

import '../../../colours.dart';
import '../../../dimens.dart';
import 'actor_list.dart';

class DetailBody extends StatelessWidget {
  final MovieDetail detail;

  DetailBody(this.detail);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: margin, left: margin, right: marginGordo),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 7,
                    child: Text(detail.title,
                        style:
                            GoogleFonts.archivoBlack(fontSize: fontGordo, color: primaryColour))),
              ],
            )),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: margin, top: margin, right: marginGordo),
          child: Text(detail.directors,
              style: GoogleFonts.tenorSans(fontSize: fontMedium, color: Colors.black)),
        ),
        Container(
          height: chipHeight,
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: marginMediumHalf),
          child: ListView.builder(
              padding: EdgeInsets.only(left: marginHalf, right: margin),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: detail.genres.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(left: marginHalf),
                  child: Chip(
                    padding: EdgeInsets.all(0),
                    backgroundColor: white,
                    shape: StadiumBorder(
                        side: BorderSide(
                      width: 1,
                      color: primaryColour,
                    )),
                    label: Text(detail.genres[index].name,
                        style: TextStyle(fontSize: font, color: primaryColour)),
                  ),
                );
              }),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: marginMediumHalf),
          padding: EdgeInsets.only(left: margin, right: margin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.calendar_today, color: primaryColour),
                  SizedBox(width: marginSmall),
                  Text(detail.releaseDate),
                  SizedBox(width: marginHalf), //Text
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.access_time, color: primaryColour),
                  SizedBox(width: marginSmall),
                  Text(detail.runtime),
                ],
              ),
              SizedBox(width: marginLarge)
            ],
          ),
        ),
        Divider(
          height: 1.0,
          indent: margin,
          endIndent: margin,
          color: primaryColourShadow,
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: margin, right: margin, top: marginMedium),
          child: Text("Overview",
              style: GoogleFonts.archivoBlack(fontSize: fontLarge, color: primaryColour)),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: margin, right: margin, top: margin),
          child: Text(detail.overview,
              style: GoogleFonts.tenorSans(fontSize: fontMedium, color: primaryBlack)),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: margin, top: marginLarge),
          child: Text("Trailers",
              textAlign: TextAlign.start,
              style: GoogleFonts.archivoBlack(fontSize: fontMedium, color: primaryColour)),
        ),
        (detail.trailers.isNotEmpty)
            ? TrailerList(detail.trailers)
            : Center(child: CircularProgressIndicator()),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: margin, top: marginMedium),
          child: Text("Cast",
              textAlign: TextAlign.start,
              style: GoogleFonts.archivoBlack(fontSize: fontMedium, color: primaryColour)),
        ),
        (detail.actors.isNotEmpty)
            ? ActorList(detail.actors)
            : Center(child: CircularProgressIndicator()),
        Container(
          margin: EdgeInsets.only(top: marginMedium, left: margin, right: margin),
          child: Divider(
            thickness: 1.0,
            color: primaryColourShadow,
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.all(margin),
            child: Text("Reviews",
                textAlign: TextAlign.start,
                style: GoogleFonts.archivoBlack(fontSize: fontLarge, color: primaryColour))),
      ],
    );
  }
}
