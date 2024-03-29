import 'package:flutter/material.dart';
import 'package:movies/data/models/navigation_models.dart';
import 'package:movies/data/models/spring_movie.dart';
import 'package:movies/dimens.dart';
import 'package:movies/domain/models/movie.dart';
import 'package:movies/ui/views/detail/detail_view.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../colours.dart';
import 'main_viewmodel.dart';

class JumboCarousel extends StatelessWidget {
  final MainViewModel viewModel;

  JumboCarousel(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      //todo: Try have a dynamic height based on screen size
      // i don't like this number, we need a wrap content instead 195.0, 217.0, 198.0
      // Solution could be to get the height of the screen and make this 20% of the height when in portrait mode
      height: 227.0,
      child: ScrollSnapList(
        key: PageStorageKey(Movie),
        itemBuilder: _buildListItem,
        itemSize: 365.0,
        itemCount: viewModel.currentMovies.length,
        margin: EdgeInsets.all(0.0),
        initialIndex: (viewModel.currentMovies.length / 2).floorToDouble(),
        onItemFocus: (int) {},
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    SpringMovie currentMovie = viewModel.currentMovies[index];
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              DetailView.id,
              arguments: MainToDetailArgs(movieId: currentMovie.id),
            );
          },
          child: Card(
            elevation: 3,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
            margin: EdgeInsets.only(left: 7.5, top: 15, right: 7.5, bottom: 15),
            borderOnForeground: false,
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        NetworkImage(currentMovie.backdropPath, scale: 0.85)),
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  BoxShadow(
                      color: primaryColourShadow4,
                      blurRadius: blurRadius,
                      spreadRadius: spreadRadius)
                ],
              ),
              child: Stack(children: <Widget>[
                Positioned(
                  left: 16.0,
                  bottom: 16.0,
                  child: Container(
                    width: 350,
                    padding: EdgeInsets.only(right: 30.0),
                    child: Text(
                      currentMovie.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.archivoBlack(
                          fontSize: fontLarge, color: white),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
