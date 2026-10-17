import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGridView = false;
  String searchQuery = '';
  int sharedDiscount = 20;

  void decreaseDiscount() {
    setState(() {
      if (sharedDiscount > 0) {
        sharedDiscount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredMovies = movies.where((movie) {
      final query = searchQuery.toLowerCase();
      return movie.title.toLowerCase().contains(query) ||
          movie.genre.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Library'),
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredMovies.isEmpty
                ? const Center(
              child: Text(
                'No movies found',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
                : isGridView
                ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  movie: filteredMovies[index],
                  discountPercent: sharedDiscount,
                  onDiscountTap: decreaseDiscount,
                );
              },
            )
                : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 240,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: MovieCard(
                    movie: filteredMovies[index],
                    discountPercent: sharedDiscount,
                    onDiscountTap: decreaseDiscount,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}