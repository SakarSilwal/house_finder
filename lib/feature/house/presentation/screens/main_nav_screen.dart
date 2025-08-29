import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_finder/feature/house/presentation/blocs/house_bloc/house_bloc.dart';
import 'package:house_finder/feature/house/presentation/blocs/house_bloc/house_event.dart';
import 'package:house_finder/feature/house/presentation/screens/fav_screen.dart';
import 'package:house_finder/feature/house/presentation/screens/house_home_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _BottomNavScreenState(); // test
}

class _BottomNavScreenState extends State<MainNavScreen> {
  String name = 'sakar';
  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller = NotchBottomBarController(
    index: 0,
  );
  final int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      const HouseHomeScreen(),
      const Page2(),
      const FavScreen(),
      const Page1(),
      const Page2(),
    ];

    return BlocProvider(
      create: (context) => HouseBloc()
        ..add(FetchHouseDetailsEvent())
        ..add(LoadCachedHouseEvent()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: bottomBarPages,
        ),
        extendBody: true,
        bottomNavigationBar: bottomBarPages.length <= maxCount
            ? AnimatedNotchBottomBar(
                notchBottomBarController: _controller,
                color: Colors.white,
                showLabel: true,
                textOverflow: TextOverflow.visible,
                maxLine: 1,
                shadowElevation: 5,
                kBottomRadius: 28.0,
                notchColor: Colors.white,
                bottomBarItems: const [
                  BottomBarItem(
                    inActiveItem: Icon(Icons.home, color: Colors.blueGrey),
                    activeItem: Icon(Icons.home, color: Colors.blueAccent),
                    itemLabel: 'Home',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(Icons.search, color: Colors.blueGrey),
                    activeItem: Icon(Icons.search, color: Colors.blueAccent),
                    itemLabel: 'Search',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(Icons.favorite, color: Colors.blueGrey),
                    activeItem: Icon(Icons.favorite, color: Colors.blueAccent),
                    itemLabel: 'Favorites',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(Icons.settings, color: Colors.blueGrey),
                    activeItem: Icon(Icons.settings, color: Colors.blueAccent),
                    itemLabel: 'Settings',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(Icons.person, color: Colors.blueGrey),
                    activeItem: Icon(Icons.person, color: Colors.blueAccent),
                    itemLabel: 'Profile',
                  ),
                ],
                onTap: (index) {
                  log('selected index: $index');
                  _pageController.jumpToPage(index);
                },
                kIconSize: 24.0,
              )
            : null,
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
    color: Colors.yellow,
    child: const Center(child: Text('Page 1')),
  );
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
    color: Colors.green,
    child: const Center(child: Text('Page 2')),
  );
}
