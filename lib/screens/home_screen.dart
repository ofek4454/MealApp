import 'package:MealsApp/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import './categorys_screen.dart';
import './saveds_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class HomeScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;

  HomeScreen(this._favoriteMeals);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': CategorysScreen(), 'title': 'Categories'},
      {'page': SavedsScreen(widget._favoriteMeals), 'title': 'Saveds'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPage]['title']),
        centerTitle: true,
      ),
      drawer: _selectedPage ==0 ? MainDrawer('/') : MainDrawer(SettingsScreen.routName),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        currentIndex: _selectedPage,
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(context).accentColor.withBlue(255),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), title: Text('Saveds')),
        ],
      ),
    );
    ;
  }
}
