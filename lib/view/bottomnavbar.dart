import 'package:flutter/material.dart';
import 'package:flutter_application_3/const/color.dart';
import 'package:flutter_application_3/view/mainpage.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'adddonor.dart';
import 'settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
//  var _currentIndex = 0;
  int _selectedIndex = 0;

  static List<Widget> _screens = [MainPage(), AddDonor(), Settings()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _screens.elementAt(_selectedIndex)),
      bottomNavigationBar: SalomonBottomBar(
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: maincolor,
          ),

          /// add
          SalomonBottomBarItem(
            icon: Icon(Icons.add),
            title: Text("Add Donor"),
            selectedColor: maincolor,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
            selectedColor: maincolor,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
//////////////////////////////////////////////////////////////
