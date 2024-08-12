import 'package:flutter/material.dart';
import 'package:savor_brew/models/navigate_model.dart';
import 'package:savor_brew/views/cart/cart.dart';
import 'package:savor_brew/views/home/home_view.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  static String id = 'nav';

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final List<NavigateModel> _screens = [
    const NavigateModel(
      text: 'Home',
      screen: HomeView(),
      icon: Icons.home_filled,
    ),
    const NavigateModel(
      text: 'Cart',
      screen: const CartView(),
      icon: Icons.shopping_cart,
    ),
    const NavigateModel(
      text: 'Profile',
      screen: Center(child: Text('Profile')),
      icon: Icons.person,
    ),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_selectedIndex].screen,
          Align(
            alignment: const Alignment(0, 1),
            child: Container(
              width: 300,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _selectedIndex,
                  elevation: 0,
                  backgroundColor: Color.fromARGB(96, 223, 223, 223),
                  showSelectedLabels: false,
                  selectedItemColor: const Color.fromARGB(255, 78, 41, 27),
                  unselectedItemColor: const Color.fromARGB(255, 194, 162, 151),
                  showUnselectedLabels: false,
                  iconSize: 30,
                  onTap: (value) {
                    setState(() {
                      _selectedIndex = value;
                    });
                  },
                  items: [
                    for (int i = 0; i < _screens.length; i++)
                      BottomNavigationBarItem(
                        icon: Icon(_screens[i].icon),
                        label: _screens[i].text,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
