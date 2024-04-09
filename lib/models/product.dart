class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
      };
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
// class Product {
//   final String imageUrl;
//   final String title;
//   final String price;
//   final String category;
//   final double rating;
//   final String description;

//   Product({
//     required this.imageUrl,
//     required this.title,
//     required this.price,
//     required this.category,
//     required this.rating,
//     required this.description,
//   });
// }

// List<Product> product = [
//   Product(
//     imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
//     title: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
//     price: '\$109.95',
//     category: 'men\'s clothing',
//     rating: 3.9,
//     description:
//         'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',
//   ),
//   Product(
//     imageUrl: 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
//     title: 'Mens Casual Premium Slim Fit T-Shirts ',
//     price: '\$22.3',
//     category: 'mens clothing',
//     rating: 4.1,
//     description:
//         'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing.',
//   ),
//   Product(
//     imageUrl: 'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg',
//     title:
//         'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet',
//     price: '\$695',
//     category: 'jewelery',
//     rating: 4.6,
//     description:
//         'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl. Wear facing inward to be bestowed with love and abundance, or outward for protection.',
//   ),
//   Product(
//     imageUrl:
//         'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
//     title: 'Solid Gold Petite Micropave ',
//     price: '\$168',
//     category: 'jewelery',
//     rating: 3.9,
//     description:
//         'Satisfaction Ensured. Design is stylish and innovative. Functionality that is Unbeatable.',
//   ),
// ];
