import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savor_brew/controller/product_cubit.dart';
import 'package:savor_brew/views/list_items.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoaded) {
          return GridView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: state.products.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.62,
                crossAxisSpacing: 10,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (context, index) {
                return ListItem(
                  popularModel: state.products[index],
                  index: index,
                );
              });
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
