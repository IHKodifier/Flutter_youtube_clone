import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:you_tube_clone/screens/video_screen.dart';
import 'package:you_tube_clone/widgets.dart';

final miniPlayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
        (ref) => MiniplayerController());

class CustomMiniPlayer extends ConsumerWidget {
  const CustomMiniPlayer({
    super.key,
    required double minHeight,
    required this.selectedVideo,
    // this.height=60,
  }) : _minHeight = minHeight;

  final double _minHeight;
  // final double height;
  final Video? selectedVideo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Miniplayer(
      controller: ref.read(miniPlayerControllerProvider),
      minHeight: _minHeight,
      maxHeight: MediaQuery.of(context).size.height,
      builder: (height, percentage) {
        if (selectedVideo == null) return const SizedBox.shrink();
        if (height <= _minHeight + 160) {
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      selectedVideo!.thumbnailUrl,
                      height: _minHeight - 4,
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
                              selectedVideo!.title,
                              style: Theme.of(context).textTheme.labelMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              selectedVideo!.author.username,
                              style: Theme.of(context).textTheme.labelMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    )),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                    ),
                    IconButton(
                      onPressed: () {
                        ref.read(selectedeVideoProvider.notifier).state = null;
                      },
                      icon: const Icon(Icons.cancel),
                    ),
                  ],
                ),

                const LinearProgressIndicator(
                  value: 0.22,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
                // Text('$height $percentage'),
              ],
            ),
          );
        }
        return const VideoScreen();
      },
    );
  }
}
