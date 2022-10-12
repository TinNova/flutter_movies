import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/ui/views/detail/trailer_list.dart';

import '../../../colours.dart';
import '../../../dimens.dart';
import 'actor_list.dart';
import 'detail_viewmodel.dart';

class DetailBody extends StatelessWidget {
  final DetailViewModel viewModel;

  DetailBody(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin:
              EdgeInsets.only(top: margin, left: margin, right: marginMedium),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 7,
                  child: Text(viewModel.detail.title,
                      style: GoogleFonts.archivoBlack(
                          fontSize: fontGordo, color: primaryColour))),
              Container(
                margin: EdgeInsets.only(top: heartShareMargin),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          viewModel.onHeartIconClick(viewModel.detail);
                        },
                        child: (viewModel.detail.isFavourite)
                            ? Icon(
                                Icons.favorite_outlined,
                                color: primaryColour,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: primaryColour,
                              )),
                    SizedBox(width: 24.0),
                    Icon(Icons.share, color: primaryColour),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin:
              EdgeInsets.only(left: margin, top: margin, right: marginGordo),
          child: Text(viewModel.detail.directors,
              style: GoogleFonts.tenorSans(
                  fontSize: fontMedium, color: Colors.black)),
        ),
        Container(
          height: chipHeight,
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: marginMediumHalf),
          child: ListView.builder(
              padding: EdgeInsets.only(left: marginHalf, right: margin),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.detail.genres.length,
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
                    label: Text(viewModel.detail.genres[index].name,
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
                  Text(viewModel.detail.releaseDate),
                  SizedBox(width: marginHalf), //Text
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.access_time, color: primaryColour),
                  SizedBox(width: marginSmall),
                  Text(viewModel.detail.runtime),
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
          margin:
              EdgeInsets.only(left: margin, right: margin, top: marginMedium),
          child: Text("Overview",
              style: GoogleFonts.archivoBlack(
                  fontSize: fontLarge, color: primaryColour)),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: margin, right: margin, top: margin),
          child: Text(viewModel.detail.overview,
              style: GoogleFonts.tenorSans(
                  fontSize: fontMedium, color: primaryBlack)),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: margin, top: marginLarge),
          child: Text("Trailers",
              textAlign: TextAlign.start,
              style: GoogleFonts.archivoBlack(
                  fontSize: fontMedium, color: primaryColour)),
        ),
        (viewModel.detail.trailers.isNotEmpty)
            ? TrailerList(viewModel.detail.trailers)
            : Center(child: CircularProgressIndicator()),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: margin, top: marginMedium),
          child: Text("Cast",
              textAlign: TextAlign.start,
              style: GoogleFonts.archivoBlack(
                  fontSize: fontMedium, color: primaryColour)),
        ),
        (viewModel.detail.actors.isNotEmpty)
            ? ActorList(viewModel.detail.actors)
            : Center(child: CircularProgressIndicator()),
        Container(
          margin:
              EdgeInsets.only(top: marginMedium, left: margin, right: margin),
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
                style: GoogleFonts.archivoBlack(
                    fontSize: fontLarge, color: primaryColour))),
      ],
    );
  }
}
