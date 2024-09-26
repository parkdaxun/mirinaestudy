import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../screen/class_screen.dart';
import '../screen/home_screen.dart';
import '../screen/homework/homework_screen.dart';
import '../screen/mypage_screen.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ClassScreen(),
    HomeworkScreen(),
    MypageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xff3A1F65).withOpacity(0.04),
              spreadRadius: 1,
              blurRadius: 10.8,
              offset: Offset(0, -10),
            ),
          ],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            unselectedLabelStyle: TextStyle(fontSize: 11, fontFamily: 'NotoSansKRMedium'),
            selectedLabelStyle: TextStyle(fontSize: 11, fontFamily: 'NotoSansKRMedium'),
            unselectedItemColor: AppColors.grey,
            selectedItemColor: AppColors.blue,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: '홈',
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/home_icon.png'),
                    SizedBox(height: 6),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/home_active_icon.png'),
                    SizedBox(height: 6),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                label: '수업',
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/class_icon.png'),
                    SizedBox(height: 6),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/class_active_icon.png'),
                    SizedBox(height: 6),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                label: '과제',
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/homework_icon.png'),
                    SizedBox(height: 6),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/homework_active_icon.png'),
                    SizedBox(height: 6),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                label: '마이페이지',
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/mypage_icon.png'),
                    SizedBox(height: 6),
                  ],
                ),
                activeIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/icons/mypage_active_icon.png'),
                    SizedBox(height: 6),
                  ],
                ),
              ),
            ],
            enableFeedback: false,
          ),
        ),
      ),
    );
  }
}
