class ProductModel {
  int idProduct;
  String title;
  num price;
  String description;
  String image;

  ProductModel({
    required this.idProduct,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      idProduct: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
    );
  }
}
