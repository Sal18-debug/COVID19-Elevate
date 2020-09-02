import 'package:covid19elevate/Bloc/StatsBloc.dart';
import 'package:covid19elevate/Bloc/StatsEvent.dart';
import 'package:covid19elevate/Screen/countryStats.dart';
import 'package:covid19elevate/Screen/globalStats.dart';
import 'package:covid19elevate/Screen/quiz.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static List _screens = [
    GlobalStats(),
    CountryStats(),
    Quiz(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      // body: getScreen(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(
                    icon: LineIcons.globe,
                    text: 'Global',
                  ),
                  GButton(
                    icon: LineIcons.line_chart,
                    text: 'Stats',
                  ),
                  GButton(
                    icon: LineIcons.question,
                    text: 'Quiz',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }

  getScreen(int selectedIndex) {
    if (selectedIndex == 0) {
      GlobalStats();
    } else if (selectedIndex == 1) {
      CountryStats();
    } else if (selectedIndex == 2) {
      Quiz();
    }
  }
}
