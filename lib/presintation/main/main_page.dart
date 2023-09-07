import 'package:banking_app/presintation/main/card/card_page.dart';
import 'package:banking_app/presintation/main/home/home_page.dart';
import 'package:banking_app/presintation/main/setting/setting_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
List Screens=[
  HomePage(),
  CardPage(),
  SettingPage(),
];
int _selectIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepOrange.withOpacity(0.5),
        animationDuration: const Duration(milliseconds: 300),
        color: Colors.deepOrange.withOpacity(0.8),
        height: 65,
        index: _selectIndex,
        onTap: (index){
        setState(() {
     _selectIndex=index;
        });
        },
        letIndexChange: (index) => true,
        items:const [
          Icon(Icons.home_filled),
          Icon(Icons.add),
          Icon(Icons.settings),
        ],
      ),
      body: Screens[_selectIndex],
    );
  }
}
