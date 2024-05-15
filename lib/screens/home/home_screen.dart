import 'package:e_shop/screens/home/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:e_shop/screens/home/widget/category.dart';
import 'package:e_shop/screens/home/widget/image_slider.dart';
import 'package:e_shop/screens/home/widget/search_bar.dart';
import 'package:e_shop/screens/home/widget/home_app_bar.dart';
import 'package:e_shop/models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              // for custom appbar
              const CustomAppBar(),
              const SizedBox(height: 20),
              // for search bar
              const MySearchBar(),
              const SizedBox(height: 20),
              ImageSlider(
                currentSlide: _currentSlider,
                onChange: (value) {
                  setState(() {
                    _currentSlider = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Categories(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special for You",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
