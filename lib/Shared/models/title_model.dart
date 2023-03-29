class TitleModel {
  final int id;
  final String title;

 const TitleModel({
    required this.id,
    required this.title,
  });

  /// ingrediants
  /// nutrition
  /// calories
  /// sizes
  /// weights

  static const List<TitleModel> _ingredients =  [
    TitleModel(id: 1, title: "Chicken"),
    TitleModel(id: 2, title: "Beef"),
     TitleModel(id: 4, title: "Fish"),
    TitleModel(id: 5, title: "Lamb"),
    TitleModel(id: 6, title: "Vegetarian"),
    TitleModel(id: 7, title: "Vegan"),
    TitleModel(id: 8, title: "Pasta"),
  ];


  static const List<TitleModel> _nutrition =  [
    TitleModel(id: 1, title: "Gluten Free"),
    TitleModel(id: 2, title: "Vegan"),
    TitleModel(id: 3, title: "Vegetarian"),
    TitleModel(id: 4, title: "Lactose Free"),

  ];
  static const List<TitleModel> _calories =  [
    TitleModel(id: 1, title: "200-300"),
    TitleModel(id: 4, title: "500-600"),
    TitleModel(id: 5, title: "600-700"),
    TitleModel(id: 8, title: "900-1000"),
  ];
  static const List<TitleModel> _sizes =  [
    TitleModel(id: 1, title: "Small"),
    TitleModel(id: 2, title: "Medium"),
    TitleModel(id: 3, title: "Large"),
  TitleModel(id: 4, title: "Extra Large"),
  ];
  static List<TitleModel> get ingredients => _ingredients;

  static List<TitleModel> get nutritions => _nutrition;

  static List<TitleModel> get calories => _calories;

  static List<TitleModel> get sizes => _sizes;
}
