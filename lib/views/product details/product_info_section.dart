import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savor_brew/controller/product_cubit.dart';
import 'package:savor_brew/core/app_styles.dart';
import 'package:savor_brew/core/widgets/custom_button.dart';
import 'package:savor_brew/models/product_model.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({
    super.key,
    required this.productModel,
  });
  final Product productModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.52,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Color.fromARGB(207, 114, 60, 39),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34), topRight: Radius.circular(34)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productModel.title,
                        maxLines: 1,
                        style: AppStyles.styleBold32(context)
                            .copyWith(color: Colors.white)),
                    Text(productModel.desc,
                        style: AppStyles.styleRegular18(context).copyWith(
                            fontSize: 18,
                            color: const Color.fromARGB(255, 78, 45, 33))),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text('✯✯✯✯✯',
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 18)),
                          const SizedBox(width: 6),
                          Text('(852 Review)',
                              style: AppStyles.styleRegular12(context)
                                  .copyWith(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(
                  flex: 4,
                ),
                BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoaded) {
                      var cubit = BlocProvider.of<ProductCubit>(context);
                      bool isInCart = state.products.any((product) =>
                          product.title == productModel.title &&
                          product.inCart);
                      return CustomButton(
                        text: isInCart ? 'Added' : '🛒 Add to Cart',
                        onPressed: () {
                          cubit.toggleCart(productModel);
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
