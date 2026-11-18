class MovieModel {
  final List<Movies> results;

  MovieModel({required this.results});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      results:
          List<Movies>.from(json['results'].map((x) => Movies.fromJson(x))),
    );
  }
}

class Movies {
  final int id;
  final String title;
  final String posterPath;

  Movies({
    required this.id,
    required this.title,
    required this.posterPath,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
    );
  }
}
