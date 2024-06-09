import 'package:flutter/material.dart';
import 'package:flutter/src/material/app_bar.dart';
import 'package:you_tube_clone/widgets.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: 150,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image.asset(
          'assets/design/yt-logo.jpg',
          height: 50,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.cast),
          iconSize: 30, 
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none,
          ),
          iconSize: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          ),
          iconSize: 30,
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: ClipOval(
        //     child: Image.network(
        //       width: 30,
        //       height: 30,
        //       currentUser.profileImageUrl,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
