import 'package:final_project/models/home_page_model.dart';
import 'package:final_project/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import '../common/utils.dart';

class MovieCardSection extends StatelessWidget {
  final String title;
  final Future<MovieModel> moviesFuture;

  const MovieCardSection(
      {Key? key, required this.title, required this.moviesFuture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        FutureBuilder(
          future: moviesFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final movies = snapshot.data!.results;
              return SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailScreen(movieId: movies[index].id),
                          ),
                        );
                      },
                      child: Container(
                        width: 120,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "$imageUrl${movies[index].posterPath}",
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              movies[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}
