class MovieTheatre {
  String id;
  String name;
  String imageUrl;

  MovieTheatre({required this.id, required this.name, required this.imageUrl});
}

List<MovieTheatre> movies = [
  MovieTheatre(
    id: '0',
    name: 'starwars',
    imageUrl: 'assets/images/starwars.jpg',
  ),
  MovieTheatre(
    id: '1',
    name: 'starwars 2',
    imageUrl: 'assets/images/starwars.jpg',
  ),
  MovieTheatre(
    id: '2',
    name: 'starwars 3',
    imageUrl: 'assets/images/starwars.jpg',
  ),
  MovieTheatre(
    id: '3',
    name: 'starwars 4',
    imageUrl: 'assets/images/starwars.jpg',
  ),
  MovieTheatre(
    id: '4',
    name: 'starwars 5',
    imageUrl: 'assets/images/starwars.jpg',
  )
];
