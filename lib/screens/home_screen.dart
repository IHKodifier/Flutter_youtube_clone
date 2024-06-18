import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/screens/video_playback.dart';
import 'dart:math' as math;
import 'package:you_tube_clone/widgets/sliver_appbar.dart';
import 'package:you_tube_clone/widgets.dart';
import 'package:you_tube_clone/ticker_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final tickerProvider =
    ChangeNotifierProvider<MyTickerProvider>((ref) => MyTickerProvider());

final rotationAnimationControllerProvider =
    Provider<AnimationController>((ref) {
  final vsync = ref.watch(tickerProvider);
  return AnimationController(
    vsync: vsync,
    duration: Durations.long1,
  );
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController rotationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rotationController = ref.read(rotationAnimationControllerProvider);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxSlide = 300.0;
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

    final selectedVideo = ref.watch(selectedeVideoProvider);
    var playback = Scaffold(
      body: SafeArea(
          child: VideoPlayBack(
        rotationController: rotationController,
      )),
    );
    var home = Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          TopicChips(chipList: chipList),
          SliverPadding(
            padding: const EdgeInsets.only(
              bottom: 160,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final video = videos[index];
                  return VideoCard(
                      animationController:
                          ref.read(rotationAnimationControllerProvider),
                      video);
                },
                childCount: videos.length,
              ),
            ),
          ),
        ],
      ),
    );
    return GestureDetector(
      onTap: toggle,
      child: AnimatedBuilder(
        animation: rotationController,
        builder: (context, _) {
          double slide = (maxSlide * rotationController.value) / 2;
          double scale = 1 - (rotationController.value * 0.3);
          return Stack(
            children: [
              playback,
              Transform.translate(
                offset: Offset(maxSlide * rotationController.value, 0),
                child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(-math.pi / 2 * rotationController.value),
                    // ..translate(slide),
                    // ..scale(scale),
                    alignment: Alignment.centerLeft,
                    child: home),
              ),
            ],
          );
        },
      ),
    );
  }

  void toggle() => rotationController.isDismissed
      ? rotationController.forward()
      : rotationController.reverse();
}
