import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/data.dart';

final selectedindexProvider = StateProvider<int>((ref) {
  return 0;
});

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  var items = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home_filled),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.explore_outlined),
        activeIcon: Icon(Icons.safety_check),
        label: 'Shorts'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.add_circle_outline,opticalSize:50,),
        activeIcon: Icon(Icons.add_circle, opticalSize:50),
        label: 'Add',
        ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.subscriptions_outlined),
        activeIcon: Icon(Icons.subscriptions),
        label: 'Subscriptions'),
    
     BottomNavigationBarItem(
        icon: CircleAvatar(
          child: ClipOval(
          child: Image.network(
            width: 30,
            height: 30,
            currentUser.profileImageUrl,
          ),
                ),
        ),
        activeIcon: Icon(Icons.video_library),
        label: 'You'),

    // IconButton(
    //   onPressed: () {},
    //   icon: ,
    // ),
  ];
  final int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => BottomNavigationBar(
        items: items,
        currentIndex: ref.watch(selectedindexProvider),
        onTap: (value) {
          ref.read(selectedindexProvider.state).state = value;
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
      ),
    );
  }
}
