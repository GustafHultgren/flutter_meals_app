import 'package:flutter/material.dart';
import 'package:flutter_meals_app/main_drawer.dart';

import 'categories_screen.dart';
import 'favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  // final List<Widget> _pages = [CategoriesScreen(), FavouritesScreen()];
  final List<Map<String, Object>> _pages = [
    {'title': 'Categories', 'widget': CategoriesScreen()},
    {'title': 'Favourites', 'widget': FavouritesScreen()},
  ];

  _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map _selectedPage = _pages[_selectedPageIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPage['title']),
      ),
      drawer: MainDrawer(),
      body: _selectedPage['widget'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          ),
        ],
      ),
    );
  }
}
