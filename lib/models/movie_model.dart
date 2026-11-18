class Movie {
  final int id;
  final String title;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'] ?? '',
    );
  }
}

class MovieResponse {
  final List<Movie> movies;

  MovieResponse({required this.movies});

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    var moviesJson = json['results'] as List;
    List<Movie> moviesList = moviesJson.map((e) => Movie.fromJson(e)).toList();
    return MovieResponse(movies: moviesList);
  }
}
