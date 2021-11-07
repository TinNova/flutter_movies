import 'package:flutter/material.dart';
import 'package:movies/data/models/navigation_models.dart';
import 'package:movies/domain/movie.dart';
import 'package:movies/ui/views/detail/detail_view.dart';
import '../../../colours.dart';
import '../../../dimens.dart';

class GridList extends StatelessWidget {
  final List<Movie> movies;

  GridList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0, bottom: 15.0),
          itemCount: movies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 2 / 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            Movie movie = movies[index];
            return Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailView.id,
                      arguments: MainToDetailArgs(movieId: movie.id),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.black,
                    shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
                    margin: EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(movie.posterPath)),
                        borderRadius: BorderRadius.circular(borderRadius),
                        boxShadow: [
                          BoxShadow(
                              color: primaryColourShadow4,
                              blurRadius: blurRadius,
                              spreadRadius: spreadRadius),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 6.0,
                  right: 6.0,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                )
              ],
            );
          }),
    );
  }
}
