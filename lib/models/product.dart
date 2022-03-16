class Product {
  late String title;

  late String desc;

  late String image;
  late String price;
  String? id;

  Product(
      {required this.title,
      required this.desc,
      required this.image,
      this.id,
      required this.price});
  factory Product.fromJson(Map<dynamic, dynamic> json) {
    return Product(
        title: json['title'],
        desc: json['desc'],
        image: json['image'],
        id: json['_id'],
        price: json['price']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'desc': desc, 'image': image, 'price': price};
  }
}
