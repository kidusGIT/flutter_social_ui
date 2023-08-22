import 'package:flutter/material.dart';
import 'package:social_ui/data/data.dart';
import 'package:social_ui/screens/home_screen.dart';
import 'package:social_ui/screens/login_screen.dart';
import 'package:social_ui/screens/profle_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  _buildDrawerOption(Icon icon, String title, Function()? onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(currentUser.backgroundImageUrl ??
                    'assets/images/login_background.jpg'),
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 10,
                bottom: 15,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(currentUser.profileImageUrl ??
                                'assets/images/login_background.jpg'),
                            fit: BoxFit.cover),
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      currentUser.name ?? '',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          _buildDrawerOption(
            Icon(Icons.dashboard),
            'Home',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(Icon(Icons.chat), 'Chat', () {}),
          _buildDrawerOption(Icon(Icons.location_on), 'Map', () {}),
          _buildDrawerOption(
            Icon(Icons.account_circle),
            'Your Profile',
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(),
              ),
            ),
          ),
          _buildDrawerOption(Icon(Icons.settings), 'Settings', () {}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                Icon(Icons.directions_run),
                'Logout',
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
