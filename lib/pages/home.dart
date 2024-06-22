import 'package:fitness_tracker/builder_blocks/simple_button.dart';
import 'package:fitness_tracker/models/category_model.dart';
import 'package:fitness_tracker/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];

  void getCategories() {
    categories = CategoryModel.getCategories();
  }

  void getDiets() {
    diets = DietModel.getDiets();
  }

  void onDietSelected(int index) {
    setState(() {
      for (var element in diets) {
        element.isViewSelected = false;
      }
      diets[index].isViewSelected = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategories();
    getDiets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          searchField(),
          const SizedBox(height: 40),
          categoriesSection(),
          const SizedBox(height: 40),
          dietsSection(),
        ],
      ),
    );
  }

  Column dietsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Recommended for you',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: diets.length,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              return dietsTile(index);
            },
          ),
        ),
      ],
    );
  }

  Widget dietsTile(int index) {
    return GestureDetector(
      onTap: () => onDietSelected(index),
      child: Container(
        width: 210,
        decoration: BoxDecoration(
          color: categories[index].boxColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(diets[index].iconPath),
            Column(
              children: [
                Text(
                  diets[index].name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${diets[index].level} | ${diets[index].duration} | ${diets[index].calories}',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Container(
                height: 45,
                width: 130,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      diets[index].isViewSelected ? const Color(0xff9dceff).withOpacity(0.4) : const Color(0xff9dceff),
                      diets[index].isViewSelected ? const Color(0xff92a3fd).withOpacity(0.4) : const Color(0xff92a3fd),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    'View',
                    style: TextStyle(
                      color: diets[index].isViewSelected ? Colors.black : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Column categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              return categoriesTile(index);
            },
          ),
        ),
      ],
    );
  }

  Container categoriesTile(int index) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: categories[index].boxColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(categories[index].icon),
            ),
          ),
          Text(
            categories[index].name,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

  Container searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xff1d1617).withOpacity(0.11),
          blurRadius: 10,
          spreadRadius: 0.0,
        ),
      ]),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: Color(0xffdddada),
            fontSize: 16,
          ),
          prefixIcon: const Icon(Icons.search, size: 35),
          suffixIcon: const SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 10,
                    thickness: 0.1,
                  ),
                  Icon(Icons.tune_rounded, size: 30),
                  SizedBox(width: 15),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: const SimpleButton(icon: Icons.arrow_back),
      actions: const [SimpleButton(icon: Icons.more_horiz)],
    );
  }
}
