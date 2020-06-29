import 'package:flutter/material.dart';
import 'package:movies/colours.dart';
import 'package:movies/ui/views/main/grid_list.dart';
import 'package:movies/widgets/text_widgets.dart';
import 'jumbo_carousel.dart';
import '../base_view.dart';
import 'main_viewmodel.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<MainViewModel>(
      onViewModelCreated: (viewModel) {
        viewModel.onViewCreated();
      },
      builder: (context, mainViewModel, child) => Scaffold(
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
                              (mainViewModel.currentMovies != null)
                                  ? JumboCarousel(mainViewModel.currentMovies)
                                  : Center(child: CircularProgressIndicator()),
                            ],
                          );
                        }, childCount: 1),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        floating: true,
                        delegate: TabHeader(
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
                                    child: TitleMedium('Upcoming'),
                                    onTap: () {
                                      mainViewModel.onUpcomingClicked(); // Here we are changing data in the ViewModel
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: GestureDetector(
                                    child: TitleMedium('Top rated'),
                                    onTap: () {
                                      mainViewModel.onTopRatedClicked();
//                                      mainViewModel.onFilmCategoryClicked(FilmCategory.TOP_RATED);
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: GestureDetector(
                                    child: TitleMedium('Popular'),
                                    onTap: () {
//                                      Provider.of<MainViewModel>(context).onPopularClicked();
                                      mainViewModel.onPopularClicked(); // Here we are changing data in the ViewModel
//                                      mainViewModel.onFilmCategoryClicked(FilmCategory.POPULAR);
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
                  body: (mainViewModel.gridMovies != null)
                      ? GridList(mainViewModel.gridMovies)
                      : Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabHeader extends SliverPersistentHeaderDelegate {
  TabHeader(
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
