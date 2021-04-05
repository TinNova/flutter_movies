import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/ui/views/base_view.dart';
import 'package:movies/ui/views/detail/detail_appbar.dart';
import 'package:movies/ui/views/detail/detail_viewmodel.dart';
import 'package:movies/ui/views/detail/trailer_list.dart';

import '../../../colours.dart';
import '../../../dimens.dart';

class DetailView extends StatefulWidget {
  static const String id = 'detail_view';

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BaseView<DetailViewModel>(
      onViewModelCreated: (detailViewModel) {
        detailViewModel.onViewCreated();
      },
      builder: (context, detailViewModel, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: DetailAppBar(minExtent: 150.0, maxExtent: 500.0),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: margin, left: margin, right: marginGordo),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 7,
                                  child: Text("Star Wars XIX",
                                      style: GoogleFonts.archivoBlack(fontSize: fontGordo, color: primaryColour))),
                            ],
                          )),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: margin, top: margin, right: marginGordo),
                        child: Text("By Joe Russo, Anthony Russo",
                            style: GoogleFonts.tenorSans(fontSize: fontMedium, color: Colors.black)),
                      ),
                      Container(
                        height: chipHeight,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: margin),
                        child: ListView.builder(
                            padding: EdgeInsets.only(left: marginHalf, right: margin),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: genres.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(left: marginHalf),
                                child: Chip(
                                  label: Text(genres[index]),
                                ),
                              );
                            }),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: margin, right: margin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.calendar_today, color: primaryColour),
                                SizedBox(width: marginSmall),
                                Text("04/27/2018"),
                                SizedBox(width: marginHalf),
                                Text("(US)")
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.access_time, color: primaryColour),
                                SizedBox(width: marginSmall),
                                Text("2h 29m")
                              ],
                            ),
                            Chip(
                              label: Text("PG-13"),
                            )
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
                        margin: EdgeInsets.only(left: margin, right: margin, top: margin),
                        child: Text("An entire universe. Once and for all.",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.archivoBlack(fontSize: fontMedium, color: primaryBlack)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: margin, right: margin, top: margin),
                        child: Text("Overview",
                            style: GoogleFonts.archivoBlack(fontSize: fontLarge, color: primaryColour)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: margin, right: margin, top: margin),
                        child: Text(
                            "As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.",
                            style: GoogleFonts.tenorSans(fontSize: fontMedium, color: primaryColour)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: margin, right: margin, top: margin, bottom: margin),
                        child: Text("Trailers",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.archivoBlack(fontSize: fontMedium, color: primaryColour)),
                      ),
                      (detailViewModel.trailers != null)
                          ? TrailerList(detailViewModel.trailers)
                          : Center(child: CircularProgressIndicator()),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.all(margin),
                        child: Text("Cast",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.archivoBlack(fontSize: fontMedium, color: primaryColour)),
                      ),
                      Divider(
                        height: 1.0,
                        indent: margin,
                        endIndent: margin,
                        color: primaryColourShadow,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.all(margin),
                        child: Text("Reviews",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.archivoBlack(fontSize: fontLarge, color: primaryColour)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  List<String> genres = <String>[
    "ScienceFiction",
    "Adventure",
    "ScienceFiction",
    "Adventure",
    "ScienceFiction",
    "Adventure"
  ];
}
