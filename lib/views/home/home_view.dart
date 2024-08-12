import 'package:flutter/material.dart';
import 'package:savor_brew/core/app_styles.dart';
import 'package:savor_brew/views/home/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Text('Welcome to Savor Brew! ',
                      style: AppStyles.styleBold32(context)),
                  Text('Enjoy your ultimate café experience!',
                      style: AppStyles.styleRegular16(context).copyWith(
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
          body: HomeViewBody(),
        ),
      ),
    );
  }
}
