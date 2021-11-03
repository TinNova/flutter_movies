import 'package:movies/data/models/mdb_actor.dart';
import 'package:movies/data/models/mdb_detail.dart';
import 'package:movies/data/models/mdb_movie.dart';
import 'package:movies/data/models/movie_trailer.dart';
import 'package:movies/data/models/review_model.dart';

import '../../consts.dart';
import '../movie.dart';
import '../movie_detail.dart';

class MovieMapper {
  Movie mapMovie(MDBMovie element) {
    return Movie(
        id: element.id,
        title: element.title,
        posterPath: MOVIE_DATABASE_IMAGE_W185 + element.posterPath,
        backdropPath: MOVIE_DATABASE_IMAGE_W780 + element.backdropPath);
  }

  Cast mapCast(MDBActor actor) {
    return Cast(
        castId: actor.castId,
        character: actor.character,
        id: actor.id,
        name: actor.name,
        order: actor.order,
        profilePath: actor.profilePath);
  }

  Trailer mapTrailer(MDBTrailer trailer) {
    return Trailer(id: trailer.id, key: trailer.key, thumbnail: trailer.thumbnail, trailerUrl: trailer.trailerUrl);
  }

  Review mapReview(MDBReview review) {
    return Review(author: review.author, content: review.content, id: review.id, url: review.url);
  }

  MovieDetail mapDetail(
      //List<Cast> casts,
      // List<Review> reviews,
      // List<Trailer> trailers,
      MDBDetail movieDetail) {
    return MovieDetail(
        id: movieDetail.id,
        title: movieDetail.title,
        overview: movieDetail.overview,
        posterPath: movieDetail.posterPath,
        backdropPath: movieDetail.backdropPath,
        // genres: mapGenre(movieDetail.genres),
        // trailers: trailers,
        // casts: casts,
        // reviews: reviews,
        popularity: movieDetail.popularity,
        releaseDate: movieDetail.releaseDate,
        revenue: movieDetail.revenue,
        runtime: movieDetail.runtime,
        tagline: movieDetail.tagline,
        voteAverage: movieDetail.voteAverage,
        voteCount: movieDetail.voteCount);
  }

  // List<Genre> mapGenre(List<MDBGenres> elements) {
  //   return elements.map((e) => Genre(id: e.id, name: e.name)).toList();
  // }
}
