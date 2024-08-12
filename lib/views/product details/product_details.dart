import 'package:flutter/material.dart';
import 'package:savor_brew/models/product_model.dart';
import 'package:savor_brew/views/product%20details/product_info_section.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    required this.popularModel,
  });
  final Product popularModel;
  static String id = "details";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height * 0.57;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: AspectRatio(
                aspectRatio: width / height,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 50,
              right: 50,
              child: Image.network(
                popularModel.image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ProductInfoSection(
                productModel: popularModel,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
