import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/ui/views/base_view.dart';
import 'package:movies/ui/views/detail/detail_viewmodel.dart';

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
      onViewModelCreated: (viewModel) {
        viewModel.onViewCreated();
      },
      builder: (context, detailViewModel, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      height: 500.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(borderRadius), bottomRight: Radius.circular(borderRadius)),
                        image:
                            DecorationImage(image: AssetImage("assets/images/poster_starwars.jpg"), fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
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
//                          SizedBox(width: 24.0),
                          Icon(Icons.favorite_border, color: primaryColour),
                          SizedBox(width: 24.0),
                          Icon(Icons.share, color: primaryColour),
//                          SizedBox(width: 24.0),
                        ]),
                      ]),
                      right: marginMedium,
                      bottom: marginDetailScreenScore,
                    )
                  ],
                ),
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: margin, left: margin, right: 144.0),
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
                  margin: EdgeInsets.only(left: margin, top: margin),
                  child: Text("By Joe Russo, Anthony Russo",
                      style: GoogleFonts.tenorSans(fontSize: fontMedium, color: Colors.black)),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: margin, top: margin, right: margin),
                  child: Wrap(
                    spacing: marginHalf,
                    children: <Widget>[
                      Chip(
                        label: Text("Science Fiction"),
                      ),
                      Chip(
                        label: Text("Adventure"),
                      ),
                      Chip(
                        label: Text("Action"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
