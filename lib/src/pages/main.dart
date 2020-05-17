import 'package:flutter/material.dart';

import 'package:flutter_tv_shows/src/pages/favoritesTvShowsPage.dart';

import 'package:flutter_tv_shows/src/pages/homePage.dart';

class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage> {

  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottomNavigationBar(),

    );
  }

    Widget _callPage( int paginaActual ) {

    switch( paginaActual ) {

      case 0: return HomePage();

      case 2: return FavoritesShowsPage();

      default:
        return HomePage();
    }

  }

  Widget _crearBottomNavigationBar() {

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          print(index);
          currentIndex = index; 
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon( Icons.home ),
          title: Text('Home')
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.search ),
          title: Text('Search')
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.favorite ),
          title: Text('Favorites')
        ),
      ],
    );


  }
}