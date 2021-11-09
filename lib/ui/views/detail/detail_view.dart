import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/data/models/navigation_models.dart';
import 'package:movies/domain/models/actor.dart';
import 'package:movies/ui/views/base_view.dart';
import 'package:movies/ui/views/detail/detail_appbar.dart';
import 'package:movies/ui/views/detail/detail_viewmodel.dart';
import 'package:movies/ui/views/detail/trailer_list.dart';

import '../../../colours.dart';
import '../../../dimens.dart';
import 'actor_list.dart';

class DetailView extends StatefulWidget {
  static const String id = 'detail_view';

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MainToDetailArgs;

    return BaseView<DetailViewModel>(
      onViewModelCreated: (viewModel) {
        viewModel.onViewCreated(args.movieId);
      },
      builder: (context, viewModel, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: DetailAppBar(viewModel.detail.posterPath),
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
                                  child: Text(viewModel.detail.title,
                                      style: GoogleFonts.archivoBlack(
                                          fontSize: fontGordo, color: primaryColour))),
                            ],
                          )),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: margin, top: margin, right: marginGordo),
                        child: Text(viewModel.detail.directors,
                            style:
                                GoogleFonts.tenorSans(fontSize: fontMedium, color: Colors.black)),
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
                        margin: EdgeInsets.only(left: margin, right: margin, top: marginMedium),
                        child: Text("Overview",
                            style: GoogleFonts.archivoBlack(
                                fontSize: fontLarge, color: primaryColour)),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: margin, right: margin, top: margin),
                        child: Text(viewModel.detail.overview,
                            style:
                                GoogleFonts.tenorSans(fontSize: fontMedium, color: primaryBlack)),
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
                            style: GoogleFonts.archivoBlack(
                                fontSize: fontLarge, color: primaryColour)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
