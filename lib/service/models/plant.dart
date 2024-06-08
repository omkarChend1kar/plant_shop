class Plant {
  final int id;
  final String name;
  final num price;
  final String? image;
  final bool isLiked;
  final bool isAdded;

  Plant({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.isLiked,
    required this.isAdded,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      isAdded: json["isAdded"],
      isLiked: json["isLiked"],
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }
}
