import 'package:cakappramuka/config/colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:cakappramuka/subpages/home_about_content.dart';
import 'package:cakappramuka/subpages/home_home_content.dart';
import 'package:cakappramuka/subpages/home_ebook_content.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  final List _pages = [
    HomeContent(),
    EbookContent(),
    AboutContent(),
  ];

  final List<GButton> pageItem = [
    GButton(icon: Icons.home, text: 'Home'),
    GButton(icon: Icons.library_books, text: 'E-book'),
    GButton(icon: Icons.info, text: 'Tentang'),
  ];

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Apakah Kakak Yakin?'),
            content: Text('Apakah kakak yakin akan keluar dari aplikasi?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Batal'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: Text('Iya'),
              ),
            ],
          ),
        )) ??
        false;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: _pages[_selectedIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: ThemeColors.primary),
            padding: EdgeInsets.all(16),
            child: GNav(
              rippleColor: Colors.white.withOpacity(0.25),
              hoverColor: Colors.white.withOpacity(0.25),
              haptic: true,
              tabBorderRadius: 99,
              tabActiveBorder:
                  Border.all(color: Colors.orange.shade700, width: 1),
              tabBorder: Border.all(color: Colors.transparent, width: 1),
              curve: Curves.easeOutExpo,
              gap: 8,
              color: Colors.white,
              activeColor: Colors.white,
              iconSize: 24,
              tabBackgroundColor: Colors.orange.shade700,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              tabs: pageItem,
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
              duration: Duration(milliseconds: 200),
            ),
          ),
        ));
  }
}
