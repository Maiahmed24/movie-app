import 'package:flutter/material.dart';
import 'movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final int discountPercent;
  final VoidCallback onDiscountTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.discountPercent,
    required this.onDiscountTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    movie.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xB3000000),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '⭐ ${movie.rating}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.bookmark_border, color: Colors.white),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xB3000000),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${movie.year}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onDiscountTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '$discountPercent%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  movie.genre,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}