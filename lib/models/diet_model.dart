class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool isViewSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    this.isViewSelected = false,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
      name: 'Honey Pancake',
      iconPath: 'assets/icons/honey-pancakes.svg',
      level: 'Easy',
      duration: '30min',
      calories: '180kCal',
      isViewSelected: true,
    ));

    diets.add(DietModel(
      name: 'Canai Bread',
      iconPath: 'assets/icons/canai-bread.svg',
      level: 'Easy',
      duration: '20min',
      calories: '230kCal',
      isViewSelected: false,
    ));

    return diets;
  }
}
