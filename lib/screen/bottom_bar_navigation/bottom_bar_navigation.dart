
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:recipe_hero/screen/browse/browes_screen.dart';
import 'package:recipe_hero/screen/favorites/favorite_screen.dart';
import 'package:recipe_hero/screen/favorites/favorites_screen2.dart';
import 'package:recipe_hero/screen/ingrediants/ingredients.dart';
import 'package:recipe_hero/screen/setting/setting_screen.dart';
import 'package:recipe_hero/splash_screen/indicator_screen/indicator_screens.dart';

class BottomBarNavigation extends StatefulWidget {
  const BottomBarNavigation({Key? key}) : super(key: key);

  @override
  State<BottomBarNavigation> createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  int _currentIndex = 0;
  late PageController _pageController;
  final List<Widget> pages =[Ingredients(),StartingScreen(),BrowseScreen(),SettingScreen()];

  late PersistentTabController _controller;


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search,size: 24,),
        title: ("Search"),
        activeColorPrimary: Color(0xffff0000),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.solidHeart),
        title: ("Favorites"),
        activeColorPrimary:Color(0xffff0000),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(FontAwesomeIcons.mask),
        title: ("Browser"),
        activeColorPrimary: Color(0xffff0000),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("Settings"),
        activeColorPrimary: Color(0xffff0000),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SizedBox.expand(
        child: PageView.builder(
          itemCount:pages.length ,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          itemBuilder: (context,index){
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar:PersistentTabView(
        context,
        controller:_controller,
        screens: pages,
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    ));
  }
}
