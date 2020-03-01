import 'package:flutter/material.dart';
import 'package:foodi/screens/category_overview_screen.dart';
import 'package:foodi/screens/favourite_meal_screen.dart';
import 'package:foodi/widgets/main_drawer.dart';

class BottomBarScreen extends StatefulWidget {
  static const String routeName = "/bottom_bar_screen";
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Map<String, Object>> _pages = [
    {"page": CategoryOverviewScreen(), "title": "Categories"},
    {"page": FavouriteMealScreen(), "title": "Favourites"},
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.deepOrangeAccent,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.white,
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Categories"),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Favourites"),
              backgroundColor: Colors.deepOrangeAccent,
            )
          ]),
    );
  }
}
