import 'package:flutter/material.dart';
import 'package:movies/colours.dart';
import 'package:movies/widgets/grid_list.dart';
import 'package:movies/widgets/text_widgets.dart';
import 'widgets/jumbo_carousel.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'main_screen';

  void onFilmCategoryClicked(FilmCategory filmCategory) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: NestedScrollView(
                controller: ScrollController(),
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: TitleMedium('In Theatres Now'),
                              padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0, bottom: 0.0),
                            ),
                            JumboCarousel(),
                          ],
                        );
                      }, childCount: 1),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      floating: true,
                      delegate: ContestTabHeader(
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.only(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
                          padding: EdgeInsetsDirectional.only(start: 25.0, top: 0.0, end: 15.0, bottom: 15.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(right: 10.0),
                                child: GestureDetector(
                                  child: TitleMedium('Latest'),
                                  onTap: () {
                                    onFilmCategoryClicked(FilmCategory.LATEST);
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: GestureDetector(
                                  child: TitleMedium('Top rated'),
                                  onTap: () {
                                    onFilmCategoryClicked(FilmCategory.TOP_RATED);
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: GestureDetector(
                                  child: TitleMedium('Popular'),
                                  onTap: () {
                                    onFilmCategoryClicked(FilmCategory.POPULAR);
                                  },
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Icon(
                                  Icons.filter_list,
                                  color: primaryColour,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: GridList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// this should be moved to it's own class
class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.searchUI,
  );

  final Widget searchUI;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 35.0;

  @override
  double get minExtent => 35.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

// this should be moved to it's own class
enum FilmCategory {
  LATEST,
  TOP_RATED,
  POPULAR,
}
