class Place {
  final int id;
  final String name;
  final String imageUrl;
  final double rating;

  Place({required this.id, required this.name, required this.imageUrl, required this.rating});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      rating: json['rating'],
    );
  }
}