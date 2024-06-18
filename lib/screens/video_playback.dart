// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/widgets.dart';

final youtubePlayerControllerProvider =
    Provider.autoDispose<YoutubePlayerController>((ref) {
  return YoutubePlayerController(
      // initialVideoId: videos.first.id,
      initialVideoId: 'MwQn2di-xeM',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ));
});

class VideoPlayBack extends ConsumerStatefulWidget {
  final AnimationController rotationController;

  const VideoPlayBack({super.key, required this.rotationController});

  @override
  ConsumerState<VideoPlayBack> createState() => _VideoPlayBackState();
}

class _VideoPlayBackState extends ConsumerState<VideoPlayBack> {
  late Video? video;
  late YoutubePlayerController _playerController;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  Duration playedTime = const Duration(milliseconds: 0);

  @override
  void initState() {
    super.initState();

    // _playerController = ref.watch(youtubePlayerControllerProvider);
    // ref.read(youtubePlayerControllerProvider).addListener(onPlayerStateChanged);
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // If you need to react to changes in your provider, do so here.
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  void onPlayerStateChanged() {
    _playerState = _playerController.value.playerState;
    if (_playerState == PlayerState.cued) {
      _playerController.play();
    }
  }

  @override
  void deactivate() {
    _playerController.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    _playerController = ref.watch(youtubePlayerControllerProvider);
    playedTime = ref.watch(youtubePlayerControllerProvider).value.position;
    ref.read(youtubePlayerControllerProvider).addListener(onPlayerStateChanged);

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _playerController,
      ),
      builder:(_,player){
        return  Scaffold(
        body: Center(
          child: Column(
            children: [
              YoutubePlayer(
                controller: _playerController,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
                onReady: () {
                  _playerController.addListener(onPlayerStateChanged);
                  // _playerController.play();
                },
              ),
              Text(
                  '${(playedTime.inSeconds / 60).toStringAsFixed(0)}m : ${(playedTime.inSeconds % 60.0).toStringAsFixed(0)} s  ',
                  style: Theme.of(context).textTheme.displaySmall),
            ],
          ),
        )
      );},
    );
  }
}
