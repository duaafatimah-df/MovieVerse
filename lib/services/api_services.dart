import 'dart:convert';
import 'dart:developer';
import 'package:final_project/common/utils.dart';
import 'package:final_project/models/genre_model.dart';
import 'package:final_project/models/home_page_model.dart';
import 'package:final_project/models/movie_detail_model.dart';
import 'package:final_project/models/movie_model.dart';
import 'package:final_project/models/movie_recommendation_mode.dart';
import 'package:final_project/models/search_model.dart';
import 'package:final_project/models/tv_series_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key=$apiKey';
late String endPoint;

class ApiServices {
  Future<MovieModel> getTrendingMovies() async {
    const endPoint = 'trending/movie/week';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('Trending Movies Fetched');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load trending movies');
  }

  Future<MovieModel> getNowPlayingMovies() async {
    const endPoint = 'movie/now_playing';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('Now Playing Movies Fetched');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load now playing movies');
  }

  Future<MovieModel> getUpcomingMovies() async {
    const endPoint = 'movie/upcoming';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('Upcoming Movies Fetched');
      return MovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load upcoming movies');
  }

  Future<TvSeriesModel> getTopRatedSeries() async {
    endPoint = 'tv/1396/recommendations';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load top rated series');
  }

  Future<MovieRecommendationsModel> getPopularMovies() async {
    endPoint = 'movie/popular';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url), headers: {});
    if (response.statusCode == 200) {
      log('success');
      return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load now playing movies');
  }

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    endPoint = 'movie/$movieId';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }

  Future<MovieRecommendationsModel> getMovieRecommendations(int movieId) async {
    endPoint = 'movie/$movieId/recommendations';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }

  Future<SearchModel> getSearchedMovie(String searchText) async {
    endPoint = 'search/movie?query=$searchText';
    final url = '$baseUrl$endPoint';
    print(url);
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0YjQxZTk4NzE4NTg1NzliNTA0MjM0NWUzM2JmZmYxMyIsIm5iZiI6MTczMTk0NjkzNi4xNzI5OTk5LCJzdWIiOiI2NzNiNjliODljMTZkYWZhMDZmOWYxNzQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.j1vk18bc4cYIsqzkvcdNj_a8aT46dPSR0rcUW3Odbmg'
    });
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log('success');
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  search movie ');
  }

  Future<GenreResponse> getGenres() async {
    const endPoint = 'genre/movie/list';
    final url = '$baseUrl$endPoint?api_key=$apiKey&language=en-US';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return GenreResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load genres');
  }

  Future<MovieResponse> getMoviesByGenre(int genreId) async {
    final String endPoint = 'discover/movie';
    final String url = '$baseUrl$endPoint?api_key=$apiKey&with_genres=$genreId';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('Movies fetched successfully');
      return MovieResponse.fromJson(jsonDecode(response.body));
    }
    throw Exception('Failed to load movies for genre');
  }
}
