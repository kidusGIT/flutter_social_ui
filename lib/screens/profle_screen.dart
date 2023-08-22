import 'package:flutter/material.dart';
import 'package:social_ui/data/data.dart';
import 'package:social_ui/widgets/posts%20_carousal.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _yourPostPageController;
  late PageController _favoritesPageController;

  @override
  void initState() {
    super.initState();
    _yourPostPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    _favoritesPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    image: AssetImage(currentUser.backgroundImageUrl ??
                        'assets/images/login_background.jpg'),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 15,
                  child: IconButton(
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).colorScheme.primary,
                      size: 35,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(currentUser.profileImageUrl ??
                              'assets/images/login_background.jpg'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          )
                        ]),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 10),
                Text(
                  currentUser.name ?? '',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Following',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          currentUser.following.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Follower',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          currentUser.followers.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                PostsCarousal(
                  pageController: _yourPostPageController,
                  title: 'Your Posts',
                  posts: currentUser.posts!,
                ),
                SizedBox(height: 10),
                PostsCarousal(
                  pageController: _favoritesPageController,
                  title: 'Favorites',
                  posts: currentUser.favorites!,
                ),
                SizedBox(height: 30),
              ],
            )
          ],
        ),
      ),
    );
  }
}
