import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:savor_brew/models/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial()) {
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final data = json.decode(response) as List;
    final products = data.map((product) => Product.fromJson(product)).toList();
    emit(ProductLoaded(products: products));
  }

  void removeCart(Product product) {
    if (state is ProductLoaded) {
      final products = List<Product>.from((state as ProductLoaded).products);
      final index = products.indexWhere((p) => p == product);

      if (index != -1) {
        // Update the product to be not in the cart "change it later"
        final updatedProduct = products[index].copyWith(inCart: false);
        products[index] = updatedProduct;
        emit(ProductLoaded(products: products));
      }
    }
  }

  void toggleCart(Product product) {
    if (state is ProductLoaded) {
      final products = List<Product>.from((state as ProductLoaded).products);
      final index = products.indexWhere((p) => p.title == product.title);

      if (index != -1) {
        final updatedProduct =
            products[index].copyWith(inCart: !products[index].inCart);
        products[index] = updatedProduct;
        emit(ProductLoaded(products: products));
      }
    }
  }

  double calculateTotalWithTax() {
    const double taxRate = 0.14;
    double subtotal =
        cartProducts.fold(0.0, (total, product) => total + product.price);
    double tax = subtotal * taxRate;
    return subtotal + tax;
  }

  List<Product> get cartProducts {
    if (state is ProductLoaded) {
      return (state as ProductLoaded).products.where((p) => p.inCart).toList();
    }
    return [];
  }
}
