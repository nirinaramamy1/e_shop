class Category {
  Category({required this.title, required this.image});

  final String title;
  final String image;
}

final List<Category> categories = [
  Category(
    title: "Shoes",
    image: "assets/images/shoes.png",
  ),
  Category(
    title: "Beauty",
    image: "assets/images/beauty.png",
  ),
  Category(
    title: "Women's\nFashion",
    image: "assets/images/image1.png",
  ),
  Category(
    title: "Jewelry",
    image: "assets/images/jewelry.png",
  ),
  Category(
    title: "Wen's\nFashion",
    image: "assets/images/men.png",
  ),
];
