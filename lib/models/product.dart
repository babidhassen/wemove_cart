class Product {
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  int id;
  String name;
  String image;
  double price;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
      };
}
