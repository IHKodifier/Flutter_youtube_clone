import 'package:flutter/material.dart';
import 'package:you_tube_clone/data.dart';
import 'package:you_tube_clone/widgets/sliver_appbar.dart';
import 'package:you_tube_clone/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // chipList.insert(0, Icon(Icons.explore));
  @override
  Widget build(BuildContext context) {
    var chipList = chips.map((e) {
      return Container(
        // height: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Chip(
            // height: 40,
            // alignment: Alignment.center,
            backgroundColor: Colors.grey.shade100,
            label: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                e,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
        ),
      );
    }).toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          TopicChips(chipList: chipList),
          SliverPadding(
            padding: EdgeInsets.only(bottom:160,),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final video = videos[index];
                  return VideoCard(video);
                },
                childCount: videos.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

