class Movie {
  final String title;
  final String genre;
  final int year;
  final double rating;
  final String image;

  const Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.rating,
    required this.image,
  });
}

// قائمة الأفلام بأسماء الصور والشخصيات المطابقة
final List<Movie> movies = [
  const Movie(
    title: 'العارف',
    genre: 'أكشن / إثارة',
    year: 2021,
    rating: 8.0,
    image: 'assets/a.jpg',
  ),
  const Movie(
    title: 'بيت الروبي',
    genre: 'كوميدي / دراما',
    year: 2023,
    rating: 7.9,
    image: 'assets/b.jpg',
  ),
  const Movie(
    title: 'لص بغداد',
    genre: 'أكشن / كوميدي',
    year: 2020,
    rating: 7.6,
    image: 'assets/c.jpg',
  ),
  const Movie(
    title: 'برشامه',
    genre: 'دراما / كوميدي',
    year: 2024,
    rating: 7.8,
    image: 'assets/d.jpg',
  ),
  const Movie(
    title: 'الهنا اللي أنا فيه',
    genre: 'كوميدي / رومانيسي',
    year: 2024,
    rating: 7.5,
    image: 'assets/e.jpg',
  ),
  const Movie(
    title: 'فاميلي بيزنس',
    genre: 'كوميدي / عائلي',
    year: 2024,
    rating: 7.4,
    image: 'assets/f.jpg',
  ),
  const Movie(
    title: 'الخلية',
    genre: 'أكشن / تشويق',
    year: 2017,
    rating: 8.2,
    image: 'assets/g.jpg',
  ),
  const Movie(
    title: 'ولاد رزق القاضية',
    genre: 'أكشن / جريمة',
    year: 2024,
    rating: 8.5,
    image: 'assets/h.jpg',
  ),
];