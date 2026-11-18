import 'package:final_project/models/genre_model.dart';
import 'package:final_project/screens/movies_by_genre_screen.dart';
import 'package:final_project/services/api_services.dart';
import 'package:flutter/material.dart';

class GenresScreen extends StatefulWidget {
  @override
  _GenresScreenState createState() => _GenresScreenState();
}

class _GenresScreenState extends State<GenresScreen> {
  late Future<GenreResponse> _genresFuture;

  @override
  void initState() {
    super.initState();
    _genresFuture = ApiServices().getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genres'),
      ),
      body: FutureBuilder<GenreResponse>(
        future: _genresFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final genres = snapshot.data!.genres;
            return ListView.builder(
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(genres[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoviesByGenreScreen(
                          genreId: genres[index].id,
                          genreName: genres[index].name,
                        ),
                      ),
                    );

                    print('Selected Genre: ${genres[index].name}');
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No data found.'));
          }
        },
      ),
    );
  }
}
