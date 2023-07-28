import 'package:flutter_pdfview_example/screen/home_screen.dart';
import 'package:flutter_pdfview_example/screen/option_screen.dart';
import 'package:flutter_pdfview_example/screen/serch_screen.dart';
import 'package:flutter_pdfview_example/screen/test_screen.dart';


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class BottomNav extends StatefulWidget {
  // final BottomNavigationBar bottom_nav;
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> widgets = [];
//문서 디렉토리 경로
  


  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState(){
    widgets.add(HomeScreen());
    widgets.add(SerchScreen());
    widgets.add(OptionScreen());
    widgets.add(TestScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: widgets.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.black),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Serch',
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                label: 'Option',
                icon: Icon(Icons.keyboard_option_key),
              ),
              BottomNavigationBarItem(
                label: 'Gallery',
                icon: Icon(Icons.image),
              ),
            ],
            unselectedItemColor: Colors.white,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

