import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/user_model.dart';

class FollowingUser extends StatelessWidget {
  const FollowingUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 20, 10.0),
          child: Text(
            'Following',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 80.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              User user = users[index];
              return Container(
                margin: EdgeInsets.all(10),
                height: 60.0,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 8,
                          color: Colors.black26)
                    ],
                    border: Border.all(
                        width: 2,
                        color: Theme.of(context).colorScheme.primary)),
                child: ClipOval(
                  child: Image(
                    height: 60.0,
                    width: 60.0,
                    image: AssetImage(user.profileImageUrl ??
                        'assets/images/login_background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
