class MovieTheatre {
  String id;
  String name;
  String imageUrl;

  MovieTheatre({this.id, this.name, this.imageUrl});
}

List<MovieTheatre> movies = [
  MovieTheatre(
    id: '0',
    name: 'starwars',
    imageUrl: 'images/starwars.jpg',
  ),
  MovieTheatre(
    id: '1',
    name: 'starwars 2',
    imageUrl: 'images/starwars.jpg',
  ),
  MovieTheatre(
    id: '2',
    name: 'starwars 3',
    imageUrl: 'images/starwars.jpg',
  ),
  MovieTheatre(
    id: '3',
    name: 'starwars 4',
    imageUrl: 'images/starwars.jpg',
  ),
  MovieTheatre(
    id: '4',
    name: 'starwars 5',
    imageUrl: 'images/starwars.jpg',
  )
];
