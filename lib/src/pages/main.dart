import 'package:flutter/material.dart';

import 'favoritesTvShows/favoritesTvShowsPage.dart';
import 'homePage/homePage.dart';

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

      case 1: return FavoritesShowsPage();

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
        // BottomNavigationBarItem(
        //   icon: Icon( Icons.search ),
        //   title: Text('Search')
        // ),
        BottomNavigationBarItem(
          icon: Icon( Icons.favorite ),
          title: Text('Favorites')
        ),
      ],
    );


  }
}