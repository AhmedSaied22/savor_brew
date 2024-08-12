import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String title;
  final String desc;
  final dynamic price;
  final bool inCart;
  final bool inFav;
  final String image;
  final num? discount;
  final num? oldPrice;
  final int? quantity;

  const Product({
    required this.title,
    required this.desc,
    required this.price,
    required this.inCart,
    required this.inFav,
    required this.image,
    this.discount,
    this.oldPrice,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      desc: json['desc'],
      price: json['price'],
      inCart: json['in_cart'],
      inFav: json['in_fav'],
      image: json['image'],
      discount: json['discount'],
      oldPrice: json['oldPrice'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'desc': desc,
        'price': price,
        'in_cart': inCart,
        'in_fav': inFav,
        'image': image,
        'discount': discount,
        'oldPrice': oldPrice,
        'quantity': quantity,
      };
        Product copyWith({
    String? title,
    String? desc,
    dynamic price,
    bool? inCart,
    bool? inFav,
    String? image,
    num? discount,
    num? oldPrice,
    int? quantity,
  }) {
    return Product(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      inCart: inCart ?? this.inCart,
      inFav: inFav ?? this.inFav,
      image: image ?? this.image,
      discount: discount ?? this.discount,
      oldPrice: oldPrice ?? this.oldPrice,
      quantity: quantity ?? this.quantity,
    );
  }



  @override
  List<Object?> get props =>
      [title, desc, price, inCart, inFav, image, discount, oldPrice, quantity];
}
