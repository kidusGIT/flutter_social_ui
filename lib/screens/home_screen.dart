import 'package:flutter/material.dart';

import '../data/data.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/following_users.dart';
import '../widgets/posts _carousal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  late PageController _favoritesController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _favoritesController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          'FRENZY',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.primary,
            letterSpacing: 10,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).colorScheme.primary,
          labelStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.primary,
          ),
          unselectedLabelStyle: TextStyle(fontSize: 17),
          tabs: const [
            Tab(text: 'Trending'),
            Tab(text: 'Latest'),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          FollowingUser(),
          SizedBox(height: 10),
          PostsCarousal(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          ),
          SizedBox(height: 10),
          PostsCarousal(
            pageController: _favoritesController,
            title: 'Favorites',
            posts: currentUser.favorites!,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
