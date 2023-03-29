import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_quiz/Shared/models/Food.dart';
import 'package:resturant_quiz/Shared/models/category.dart';
import 'package:resturant_quiz/Shared/models/seat.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MenuController extends GetxController {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  GlobalKey<SideMenuState> get sideMenuKey => _sideMenuKey;

  // scaffold key
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeSelectedIndex(int index) {
    _selectedIndex = index;
    update();
  }

  List<Food> allMenu = Food.menu;
  List<Category> categories = Category.contents;

  late List<Food> selectedList = allMenu.where((i) => i.category == 1).toList();
  late List<Food> cartList = [];
  late int total = 0;

  int getItemCount(int foodId) {
    if (cartList.isEmpty) {
      return 0;
    } else {
      return cartList.firstWhere((element) => element.id == foodId).count;
    }
  }

  void filterByCategory(int categoryid) {
    selectedList = allMenu.where((i) => i.category == categoryid).toList();
    update();
  }

  void setSelectedCategory(Category selectedCategory) {
    for (var element in categories) {
      element.selected = false;
    }
    categories.firstWhere((element) => element == selectedCategory).selected =
        true;
    filterByCategory(selectedCategory.id);
  }

  void addItemToCart(Food food) {
    if (cartList.contains(food)) {
      cartList.firstWhere((element) => element == food).count = food.count + 1;
    } else {
      cartList.add(food);
      cartList.firstWhere((element) => element == food).count = 1;
    }
    getTotalPrice();
    update();
  }

  void searchByName(String name) {
    if (name.isEmail) {
      selectedList = allMenu;
    } else {
      selectedList = allMenu
          .where((element) =>
              element.title.contains(name) || element.title.startsWith(name))
          .toList();
    }
    update();
  }

  void getTotalPrice() {
    total = 0;
    for (var item in cartList) {
      total = total + (item.price * item.count).toInt();
    }
    update();
  }

  void removeItemFromCart(Food food) {
    if (cartList.contains(food)) {
      if (food.count > 1) {
        cartList.firstWhere((element) => element == food).count =
            food.count - 1;
      } else {
        cartList.firstWhere((element) => element == food).count = 0;
        cartList.remove(food);
      }
    }
    getTotalPrice();
    update();
  }

  /// ingrediants - neutrations - calories - sizes - weight
  List<int> _ingrediants = [];

  List<int> get selectedIngredients => _ingrediants;

  void chooseIngredients(int id) {
    if (_ingrediants.contains(id)) {
      _ingrediants.remove(id);
    } else {
      _ingrediants.add(id);
    }
    update();
  }

  List<int> _nutrations = [];

  List<int> get selectedNutrations => _nutrations;

  void chooseNutrations(int id) {
    if (_nutrations.contains(id)) {
      _nutrations.remove(id);
    } else {
      _nutrations.add(id);
    }
    update();
  }

  List<int> _calories = [];

  List<int> get selectedCalories => _calories;

  void chooseCalories(int id) {
    if (_calories.contains(id)) {
      _calories.remove(id);
    } else {
      _calories.add(id);
    }
    update();
  }

  List<int> _sizes = [];

  List<int> get selectedSizes => _sizes;

  void chooseSizes(int id) {
    if (_sizes.contains(id)) {
      _sizes.remove(id);
    } else {
      _sizes.add(id);
    }
    update();
  }

  String _weight = '';

  String get selectedWeight => _weight;

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController numOfPeopleController = TextEditingController();
  TextEditingController tableNumber = TextEditingController();

  String get _orderedFood {
    String food = '';
    for (var item in cartList) {
      food = '$food${item.title} x ${item.count} ,';
    }
    return food;
  }

  String get bookingDetails {
    String details = '';
    if (_weight.isNotEmpty) {
      details = '${details}Weight: $_weight';
    }
    if (_sizes.isNotEmpty) {
      details = '${details}Size: ${_sizes.join(', ')}';
    }
    if (_calories.isNotEmpty) {
      details = '${details}Calories: ${_calories.join(', ')}';
    }
    if (_nutrations.isNotEmpty) {
      details = '${details}Nutrations: ${_nutrations.join(', ')}';
    }
    if (_ingrediants.isNotEmpty) {
      details = '${details}Ingrediants: ${_ingrediants.join(', ')}';
    }
    return 'You have booked an order on date:'
        ' ${dateController.text} at ${timeController.text}'
        ' for ${numOfPeopleController.text} people.\n '
        'You have ordered: $_orderedFood\n with details: $details';
  }

  void selectDate(DateTime date) {
    dateController.text =
        date != null ? '${date.day}/${date.month}/${date.year}' : '';
  }

  void selectTime(TimeOfDay time) {
    timeController.text = time != null ? time.format(Get.context!) : '';
  }

  int selectedSeat = -1;

  void selectTableNumber(int tableNumber) {
    selectedSeat = tableNumber;
    getSeats();
  }

  void clearAll() {
    _ingrediants.clear();
    _nutrations.clear();
    _calories.clear();
    _sizes.clear();
    _weight = '';
    dateController.clear();
    timeController.clear();
    numOfPeopleController.clear();
    tableNumber.clear();
    selectedSeat = -1;
    cartList.clear();
    getTotalPrice();
    update();
  }

  bool get canOrder {
    print(
        'can order: ${dateController.text.isNotEmpty} - ${timeController.text.isNotEmpty}- ${numOfPeopleController.text.isNotEmpty}${tableNumber.text.isNotEmpty}');
    return dateController.text.isNotEmpty &&
        timeController.text.isNotEmpty &&
        numOfPeopleController.text.isNotEmpty &&
        selectedSeat != -1;
  }

  bool get canBookTable {
    return dateController.text.isNotEmpty &&
        timeController.text.isNotEmpty &&
        numOfPeopleController.text.isNotEmpty;
  }

  List<Seat> getSeats() {
    return List.generate(
      25,
      (index) => Seat(
        reserved: Random().nextBool(),
        id: index,
      ),
    );
  }

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    numOfPeopleController.dispose();
    tableNumber.dispose();
    super.dispose();
  }
}
