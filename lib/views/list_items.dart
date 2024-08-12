import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savor_brew/controller/product_cubit.dart';
import 'package:savor_brew/core/app_styles.dart';
import 'package:savor_brew/models/product_model.dart';
import 'package:savor_brew/views/product%20details/product_details.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.popularModel,
    required this.index,
  });
  final Product popularModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetails(
                popularModel: popularModel,
              ),
            ));
      },
      child: Container(
          height: MediaQuery.sizeOf(context).height * 0.36,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 10,
              blurStyle: BlurStyle.inner,
              color: const Color.fromARGB(255, 221, 218, 218).withOpacity(0.15),
              spreadRadius: 0,
              offset: const Offset(0, 10),
            ),
          ]),
          child: Card(
            elevation: 3,
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1.2 / 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey.withOpacity(0.2)),
                      child: Image.network(
                        popularModel.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    popularModel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.styleBold24(context),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.90,
                    child: Text(
                      popularModel.desc,
                      style: AppStyles.styleRegular16(context)
                          .copyWith(color: Colors.grey),
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '\$${popularModel.price.toString()}',
                            style: AppStyles.styleBold20(context)
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                      const Spacer(),
                      BlocConsumer<ProductCubit, ProductState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is ProductLoaded) {
                            return Center(
                              child: IconButton(
                                  icon: Icon(
                                    state.products[index].inCart
                                        ? Icons.remove_shopping_cart
                                        : Icons.add_shopping_cart,
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<ProductCubit>(context)
                                        .toggleCart(state.products[index]);
                                  }),
                            );
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
