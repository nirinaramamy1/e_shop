import 'package:flutter/material.dart';
import 'package:e_shop/models/category.dart';
import 'package:e_shop/screens/home/widget/product_card.dart';
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
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategories = [
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion,
    ];

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
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _selectedIndex == index // this _selectedIndex
                              ? Colors.blue[200]
                              : Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(categories[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              categories[index].title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
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
                itemCount: selectedCategories[_selectedIndex]
                    .length, // this _selectedIndex must be same
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: selectedCategories[_selectedIndex][index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
