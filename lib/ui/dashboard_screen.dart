import 'package:flutter/material.dart';
import 'package:spotify_clone/ui/home_screen.dart';
import 'package:spotify_clone/ui/library_screen.dart';
import 'package:spotify_clone/ui/search_category_screen.dart';

class DashBoardScreen extends StatefulWidget {
  final String userType; // Define userType as a parameter

  const DashBoardScreen({super.key, required this.userType}); // Accept userType in the constructor

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.95),
        elevation: 0,
        selectedLabelStyle: const TextStyle(fontFamily: "AM", fontSize: 13),
        selectedItemColor: const Color(0xffE5E5E5),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: widget.userType == 'premium' // Access userType using widget.userType
            ? [
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_home.png'),
                  activeIcon: Image.asset('images/icon_home_active.png'),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_search_bottomnav.png'),
                  activeIcon: Image.asset(
                    'images/icon_search_active.png',
                    color: Colors.white,
                  ),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'images/icon_library.png',
                    color: Colors.grey,
                  ),
                  activeIcon: Image.asset(
                    'images/icon_library_active.png',
                    color: Colors.white,
                  ),
                  label: "Your Library",
                ),
              ]
            : [
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_home.png'),
                  activeIcon: Image.asset('images/icon_home_active.png'),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'images/icon_library.png',
                    color: Colors.grey,
                  ),
                  activeIcon: Image.asset(
                    'images/icon_library_active.png',
                    color: Colors.white,
                  ),
                  label: "Your Library",
                ),
              ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: widget.userType == 'premium' // Access userType using widget.userType
            ? [
                HomeScreen(userType: widget.userType), // Pass userType to HomeScreen
                SearchCategoryScreen(),
                LibraryScreen(),
              ]
            : [
                HomeScreen(userType: widget.userType), // Pass userType to HomeScreen
                LibraryScreen(),
              ],
      ),
    );
  }
}