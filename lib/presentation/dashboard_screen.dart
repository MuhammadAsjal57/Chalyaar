
import 'package:chalyaar/core/utils/color_constant.dart';
import 'package:chalyaar/core/utils/size_utils.dart';
import 'package:chalyaar/presentation/Notifications_screen.dart';
import 'package:chalyaar/presentation/home_screen.dart';
import 'package:chalyaar/presentation/my_chalyaar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List<Widget> pagesList=[
    HomeScreen(),
    Notification_screen(),
    MyChalyaarScreen()
  ];

 
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children:pagesList
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(60, 161, 161, 161),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 0),
            ),
          ],
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: BottomAppBar(
          color: Colors.white,
          height: getVerticalSize(70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(FontAwesomeIcons.houseChimneyWindow, color: _currentPage == 0 ? ColorConstant.orange: Colors.black54), // Change color based on current page
                onPressed: () {
                    
                  _pageController.jumpToPage(0);
                },
              ),
              // IconButton(
              //   icon: Icon(CupertinoIcons.person_2_fill, color: _currentPage == 1 ? ColorConstant.orange: Colors.black54,size: 28,), // Change color based on current page
              //   onPressed: () {
              
              //     _pageController.jumpToPage(1);
              //   },
              // ),
              IconButton(
                icon: Icon(FontAwesomeIcons.solidBell, color: _currentPage == 2 ? ColorConstant.orange : Colors.black54), // Change color based on current page
                onPressed: () {
                  
                  _pageController.jumpToPage(2);
                },
              ),
              // IconButton(
              //   icon: Icon(FontAwesomeIcons.wallet, color: _currentPage == 3 ? ColorConstant.orange : Colors.black54), // Change color based on current page
              //   onPressed: () {

              //     _pageController.jumpToPage(3);
              //   },
              // ),
              IconButton(
                icon: Icon(Icons.person, color: _currentPage == 4 ? ColorConstant.orange : Colors.black54), // Change color based on current page
                onPressed: () {
                
                  _pageController.jumpToPage(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
        
  }
}
