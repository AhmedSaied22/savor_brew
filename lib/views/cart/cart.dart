import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savor_brew/controller/product_cubit.dart';
import 'package:savor_brew/core/app_styles.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoaded) {
              var cubit = BlocProvider.of<ProductCubit>(context);
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = cubit.cartProducts[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 139, 69, 19),
                                Color.fromARGB(255, 205, 133, 63),
                                Color.fromARGB(255, 255, 228, 196),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.3,
                                child: AspectRatio(
                                  aspectRatio: 1.3 / 1,
                                  child: Image.network(
                                    product.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      style: AppStyles.styleBold24(context)
                                          .copyWith(color: Colors.white),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '\$${product.price.toStringAsFixed(2)}',
                                      style: AppStyles.styleBold24(context)
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: Icon(
                                      product.inCart
                                          ? Icons.remove_shopping_cart
                                          : Icons.add_shopping_cart,
                                    ),
                                    onPressed: () {
                                      cubit.toggleCart(product);
                                    },
                                  ))
                            ],
                          ),
                        );
                      },
                      childCount: cubit.cartProducts.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 128, 64, 41),
                          borderRadius: BorderRadius.circular(12)),
                      child: RichText(
                        text: TextSpan(
                          text: 'Total with Tax ',
                          style: AppStyles.styleBold28(context).copyWith(
                              fontWeight: FontWeight.bold, color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                                text: '14%',
                                style: AppStyles.styleRegular16(context)),
                            TextSpan(
                              text:
                                  ' : \$${cubit.calculateTotalWithTax().toStringAsFixed(2)}',
                              style: AppStyles.styleBold28(context).copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
