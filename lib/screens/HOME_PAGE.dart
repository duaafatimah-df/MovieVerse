import 'package:final_project/models/home_page_model.dart';
import 'package:flutter/material.dart';
import 'package:final_project/screens/genre_screen.dart';
import 'package:final_project/screens/search_screen.dart';
import 'package:final_project/screens/news_and_hot.dart';
import 'package:final_project/widgets/movie_card_widget.dart';
import 'package:final_project/widgets/custom_carousel.dart';
import 'package:final_project/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices = ApiServices();

  late Future<MovieModel> trendingMovies;
  late Future<MovieModel> nowPlayingMovies;
  late Future<MovieModel> upcomingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = apiServices.getTrendingMovies();
    nowPlayingMovies = apiServices.getNowPlayingMovies();
    upcomingMovies = apiServices.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/LOGO.png',
          height: 150,
          width: 150,
        ),
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: InkWell(
              onTap: () {},
              child: Container(
                color: Colors.blue,
                height: 27,
                width: 27,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: trendingMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomCarousel(movies: snapshot.data!.results);
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MovieCardSection(
                title: 'Now Playing',
                moviesFuture: nowPlayingMovies,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MovieCardSection(
                title: 'Upcoming Movies',
                moviesFuture: upcomingMovies,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: 'New'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Genre'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MoreScreen(),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GenresScreen(),
              ),
            );
          }
        },
      ),
    );
  }
}
