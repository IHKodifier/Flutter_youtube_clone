// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:you_tube_clone/screens/home_screen.dart';
import 'package:you_tube_clone/widgets.dart';

import '../widgets/custom_miniplayer.dart';

class NavScreen extends ConsumerStatefulWidget {
  const NavScreen({super.key});

  @override
  ConsumerState<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends ConsumerState<NavScreen> {
  final _minHeight = 70.0;
  final screens = [
    const HomeScreen(),
    const Scaffold(
      body: Center(
        child: Text('Explore'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Add'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Subscriptions'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Library'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedVideo = ref.watch(selectedeVideoProvider);
    bool isLargeDisplay = MediaQuery.of(context).size.width > 600;
    Widget selectedPage = Consumer(
      builder: (context, ref, child) =>
          screens[ref.watch(selectedindexProvider)],
    );

    return Scaffold(
      // appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 66, left: 8.0),
              child: GestureDetector(
                child: const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.home_outlined,
                    ),
                  ),
                  title: Text('Home'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: screens
            .asMap()
            .map((i, screen) => MapEntry(
                  i,
                  Offstage(
                      offstage: ref.watch(selectedindexProvider) != i,
                      child: selectedPage),
                ))
            .values
            .toList()
          ..add(Offstage(
            offstage: selectedVideo == null,
            child: CustomMiniPlayer(
              minHeight: _minHeight,
              selectedVideo: selectedVideo,
            ),
          )),
      ),
      bottomNavigationBar: !isLargeDisplay ? const CustomBottomNavigationBar() : null,
    );
  }
}
