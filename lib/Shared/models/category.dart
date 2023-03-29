class Category {
  final String title;
  final String image;
  final int id;
  final int count;
  bool selected;

  Category({
    required this.title,
    required this.image,
    required this.id,
    required this.count,
    this.selected = false,
  });

  static List<Category> contents = [
    Category(
      id: 1,
      title: "Pizza",
      image: "assets/icons/pizza.png",
      count: 5,
      selected: true,
    ),
    Category(
      id: 2,
      title: "Burger",
      count: 3,
      image: "assets/icons/burger.png",
    ),

    /// sandwich
    Category(
      id: 3,
      title: "Sandwich",
      count: 4,
      image: "assets/icons/sandwich.png",
    ),
    Category(
      id: 4,
      title: "Sushi",
      count: 0,
      image: "assets/icons/breakfast.png",
    ),

    Category(
      id: 5,
      title: "Grilled",
      count: 0,
      image: "assets/icons/barbecue.png",
    ),
  ];
}
