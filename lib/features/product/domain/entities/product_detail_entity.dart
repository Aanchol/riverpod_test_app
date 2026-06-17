class ProductDetailsEntity {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double rating;
  final List<String> images;
  final String thumbnail;

  const ProductDetailsEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.rating,
    required this.images,
    required this.thumbnail,
  });
}
