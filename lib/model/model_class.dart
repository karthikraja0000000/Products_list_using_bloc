class Product {
  final String name;
  final String image;
  final double rate;
  final double discount;
  final double rating;

  Product({
    required this.name,
    required this.image,
    required this.rate,
    required this.discount,
    required this.rating,
  });


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['title'] ?? '',
      image: json['thumbnail'] ?? '',
      rate: (json['price'] ?? 0).toDouble(),
      discount: (json['discountPercentage'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }

}