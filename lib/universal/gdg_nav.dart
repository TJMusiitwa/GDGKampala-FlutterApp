import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_dev_group_kampala/screens/home/home.dart';
import 'package:google_dev_group_kampala/screens/map/chapters_map.dart';
import 'package:google_dev_group_kampala/screens/news_blog/news_blog_page.dart';
import 'package:google_dev_group_kampala/screens/settings/settings.dart';
import 'package:google_dev_group_kampala/screens/team/team.dart';

class GDGBottomNav extends StatefulWidget {
  @override
  _GDGBottomNavState createState() => _GDGBottomNavState();
}

class _GDGBottomNavState extends State<GDGBottomNav> {
  var _currentScreen = 0;

  var _screens = [
    HomeScreen(),
    NewsBlogPage(),
    //EventsScreen(),
    TeamScreen(),
    ChaptersMapScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _screens.elementAt(_currentScreen),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Team'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Chapters'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightBlue[900],
        unselectedItemColor: Colors.grey,
        currentIndex: _currentScreen,
        onTap: (int index) {
          setState(() {
            _currentScreen = index;
          });
        },
      ),
    );
  }
}
