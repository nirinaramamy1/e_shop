import 'package:e_shop/screens/cart/cart_screen.dart';
import 'package:e_shop/screens/favorite/favorite.dart';
import 'package:e_shop/screens/home/home_screen.dart';
import 'package:e_shop/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:e_shop/constant.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 2;
  final List _screens = const [
    Scaffold(),
    Favorite(),
    HomeScreen(),
    CartScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        shape: const CircleBorder(),
        backgroundColor: kprimaryColor,
        child: const Icon(
          Icons.home,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.grid_view_outlined,
                size: 25,
                color:
                    _currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.favorite,
                size: 25,
                color:
                    _currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 25,
                color:
                    _currentIndex == 3 ? kprimaryColor : Colors.grey.shade400,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _currentIndex = 4;
                });
              },
              icon: Icon(
                Icons.person,
                size: 25,
                color:
                    _currentIndex == 4 ? kprimaryColor : Colors.grey.shade400,
              ),
            )
          ],
        ),
      ),
      body: _screens[_currentIndex],
    );
  }
}
