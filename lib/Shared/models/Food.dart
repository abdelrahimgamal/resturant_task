import 'package:resturant_quiz/Shared/models/title_model.dart';

import 'extras.dart';

class Food {
  final String title;
  final String? image;
  final int id;
  final int category;
  final double price;
  int oldPrice;
  late int count;
  final List<Extras> extras;
  final String desc;
  final bool choosen;
  int? discount;
  final List<String>? foodImages;
  final List<TitleModel> ingredients;
  final List<TitleModel> nutritions;
  final List<TitleModel> calories;
  final List<TitleModel> sizes;
  final String weight;

  Food({
    required this.title,
    this.image,
    required this.id,
    required this.category,
    required this.price,
    this.oldPrice = 0,
    required this.count,
    required this.extras,
    required this.desc,
    required this.choosen,
    this.foodImages,
    this.ingredients = const [],
    this.nutritions = const [],
    this.calories = const [],
    this.sizes = const [],
    this.weight = '',

   }) {
    discount =
        oldPrice == 0 ? 0 : ((oldPrice - price) / oldPrice * 100).round();
  }


  @override
  String toString() {
    return 'Food{title: $title, image: $image, id: $id, category: $category, price: $price, oldPrice: $oldPrice, count: $count, extras: $extras, desc: $desc, choosen: $choosen, discount: $discount, foodImages: $foodImages, ingredients: $ingredients, nutritions: $nutritions, calories: $calories, sizes: $sizes, weight: $weight}';
  }

  static List<Food> menu = [
    Food(
      title: "Pizza veloper",
      image: "assets/images/img_pizza_1.png",
      id: 1,
      category: 1,
      choosen: false,
      count: 0,
      desc:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero",
      extras: Extras.extras,
      price: 150,
      oldPrice: 200,
      foodImages: [
        'https://images.unsplash.com/photo-1594007654729-407eedc4be65?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=728&q=80',
        'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=536&q=80',
        'https://images.unsplash.com/photo-1593504049359-74330189a345?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
      ],
      sizes: TitleModel.sizes,
      weight:  '10',
      ingredients:  TitleModel.ingredients,
      nutritions:  TitleModel.nutritions,
      calories:  TitleModel.calories,
    ),
    Food(
      title: "Pizza Cantos",
      image: "assets/images/img_pizza_2.png",
      id: 1,
      category: 1,
      choosen: false,
      count: 0,
      desc:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero",
      extras: Extras.extras,
      price: 180,
      foodImages: [
        'https://images.unsplash.com/photo-1594007654729-407eedc4be65?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=728&q=80',
        'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=536&q=80',
        'https://images.unsplash.com/photo-1593504049359-74330189a345?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
      ],
      sizes: TitleModel.sizes,
      weight:  ' 10',
      ingredients:  TitleModel.ingredients,
      nutritions:  TitleModel.nutritions,
      calories:  TitleModel.calories,
    ),
    Food(
      title: "Pizza veloper",
      image: "assets/images/img_pizza_2.png",
      id: 1,
      category: 1,
      choosen: false,
      count: 0,
      desc:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero",
      extras: Extras.extras,
      price: 190,
      foodImages: [
        'https://images.unsplash.com/photo-1594007654729-407eedc4be65?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=728&q=80',
        'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=536&q=80',
        'https://images.unsplash.com/photo-1593504049359-74330189a345?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
      ],
      sizes: TitleModel.sizes,
      weight:  '10',
      ingredients:  TitleModel.ingredients,
      nutritions:  TitleModel.nutritions,
      calories:  TitleModel.calories,
    ),
    Food(
      title: "Pizza veloper",
      image: "assets/images/img_pizza_2.png",
      id: 1,
      category: 1,
      choosen: false,
      count: 0,
      desc:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero",
      extras: Extras.extras,
      price: 190,
      foodImages: [
        'https://images.unsplash.com/photo-1594007654729-407eedc4be65?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=728&q=80',
        'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=536&q=80',
        'https://images.unsplash.com/photo-1593504049359-74330189a345?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
      ],
      sizes: TitleModel.sizes,
      weight:  '10',
      ingredients:  TitleModel.ingredients,
      nutritions:  TitleModel.nutritions,
      calories:  TitleModel.calories,
    ),
    Food(
      title: "Pizza veloper",
      image: "assets/images/img_pizza_2.png",
      id: 1,
      category: 1,
      choosen: false,
      count: 0,
      desc:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero",
      extras: Extras.extras,
      price: 190,
      foodImages: [
        'https://images.unsplash.com/photo-1594007654729-407eedc4be65?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=728&q=80',
        'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=536&q=80',
        'https://images.unsplash.com/photo-1593504049359-74330189a345?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
      ],
      sizes: TitleModel.sizes,
      weight:  '10',
      ingredients:  TitleModel.ingredients,
      nutritions:  TitleModel.nutritions,
      calories:  TitleModel.calories,
    ),
    Food(
      title: "Burger miau",
      image: "assets/images/img_burger_1.png",
      id: 1,
      category: 2,
      choosen: false,
      count: 0,
      desc:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero",
      extras: Extras.extras,
      price: 90,
      oldPrice: 120,
      sizes: TitleModel.sizes,
      weight:  '10',
      ingredients:  TitleModel.ingredients,
      nutritions:  TitleModel.nutritions,
      calories:  TitleModel.calories,
    ),
    Food(
      title: "Burger Cheese",
      image: "assets/images/img_burger_1.png",
      id: 1,
      category: 2,
      choosen: false,
      count: 0,
      desc:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero",
      extras: Extras.extras,
      price: 70,
      oldPrice: 100,
      sizes: TitleModel.sizes,
      weight:  '10',
      ingredients:  TitleModel.ingredients,
      nutritions:  TitleModel.nutritions,
      calories:  TitleModel.calories,
    ),
    Food(
      title: "Burger Wranch",
      image: "assets/images/img_burger_1.png",
      id: 1,
      category: 2,
      choosen: false,
      count: 0,
      desc:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero",
      extras: Extras.extras,
      price: 50,
      sizes: TitleModel.sizes,
      weight:  '10',
      ingredients:  TitleModel.ingredients,
      nutritions:  TitleModel.nutritions,
      calories:  TitleModel.calories,
    ),
    Food(
      title: "Flafel Sandwitch",
      id: 1,
      category: 3,
      choosen: false,
      count: 0,
      desc:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero",
      extras: Extras.extras,
      price: 10,
      sizes: TitleModel.sizes,
      weight:  '10',
      ingredients:  TitleModel.ingredients,
      nutritions:  TitleModel.nutritions,
      calories:  TitleModel.calories,
    ),
    Food(
      title: "Flafel Sandwitch",
      id: 1,
      category: 3,
      choosen: false,
      count: 0,
      desc:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero",
      extras: Extras.extras,
      price: 10,
      sizes: TitleModel.sizes,
      weight:  '10',
      ingredients:  TitleModel.ingredients,
      nutritions:  TitleModel.nutritions,
      calories:  TitleModel.calories,
    ),
    Food(
      title: "Flafel Sandwitch",
      id: 1,
      category: 3,
      choosen: false,
      count: 0,
      desc:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero",
      extras: Extras.extras,
      price: 10,
      sizes: TitleModel.sizes,
      weight:  '10',
      ingredients:  TitleModel.ingredients,
      nutritions:  TitleModel.nutritions,
      calories:  TitleModel.calories,
    ),
    Food(
      title: "Flafel Sandwitch",
      id: 1,
      category: 3,
      choosen: false,
      count: 0,
      desc:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero",
      extras: Extras.extras,
      price: 10,
      sizes: TitleModel.sizes,
      weight:  '10',
      ingredients:  TitleModel.ingredients,
      nutritions:  TitleModel.nutritions,
      calories:  TitleModel.calories,
    ),
  ];
}
