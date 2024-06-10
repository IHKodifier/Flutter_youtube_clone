import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:you_tube_clone/screens/video_screen.dart';
import 'package:you_tube_clone/widgets.dart';

final miniPlayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
  (ref) => MiniplayerController(),
);

class CustomMiniPlayer extends ConsumerStatefulWidget {
  const CustomMiniPlayer({
    super.key,
    required double minHeight,
    required this.selectedVideo,
  }) : _minHeight = minHeight;

  final double _minHeight;
  final Video? selectedVideo;

  @override
  ConsumerState<CustomMiniPlayer> createState() => _CustomMiniPlayerState();
}

class _CustomMiniPlayerState extends ConsumerState<CustomMiniPlayer> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Set initial opacity to 0.0 when the widget is built
    _opacity = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Miniplayer(
      controller: ref.read(miniPlayerControllerProvider),
      minHeight: widget._minHeight,
      maxHeight: MediaQuery.of(context).size.height,
      builder: (height, percentage) {
        if (widget.selectedVideo == null) return const SizedBox.shrink();
        if (height <= widget._minHeight + 160) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 200),
            
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      widget.selectedVideo!.thumbnailUrl,
                      height: widget._minHeight - 4,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                widget.selectedVideo!.title,
                                style:
                                    Theme.of(context).textTheme.labelMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                widget.selectedVideo!.author.username,
                                style:
                                    Theme.of(context).textTheme.labelMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                    ),
                    IconButton(
                      onPressed: () {
                        ref.read(selectedeVideoProvider.notifier).state =
                            null;
                      },
                      icon: const Icon(Icons.cancel),
                    ),
                  ],
                ),
                const LinearProgressIndicator(
                  value: 0.22,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ],
            ),
          );
        }
        return const VideoScreen();
      },
    );
  }
}
