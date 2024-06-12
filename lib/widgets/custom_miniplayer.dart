// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/screens/video_screen.dart';
import 'package:you_tube_clone/widgets.dart';

final miniPlayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
  (ref) => MiniplayerController(),
);

class CustomMiniPlayer extends ConsumerStatefulWidget  {
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
  // double _opacity = 0.0;
  double maxWidth = 0;

  @override
  void initState() {
    super.initState();
    // _opacity = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    maxWidth = MediaQuery.of(context).size.width;
    return Miniplayer(
      elevation: 105,
      controller: ref.read(miniPlayerControllerProvider),
      minHeight: widget._minHeight,
      maxHeight: MediaQuery.of(context).size.height,
      curve: Curves.bounceInOut,
      builder: buildMiniPlayer,
    );
  }

  Widget _buildMiniPlayerContent(BuildContext context, height, percentage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: _buildMiniPlayerThumbnail(context, height, percentage)),
        const LinearProgressIndicator(
          value: 0.22,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        ),
      ],
    );
  }

  Widget _buildMiniPlayerThumbnail(BuildContext context, height, percentage) {
    print('H= $height %AGE= ${(percentage * 100).toStringAsFixed(2)}');
    return Row(
      children: [
        Image.network(
          widget.selectedVideo!.thumbnailUrl,
          // height: widget._minHeight + (percentage * 10) - 4,
          width: height > widget._minHeight+100 ? maxWidth-6 : widget._minHeight + height * 2,
          fit: height>widget._minHeight?
          BoxFit.fitWidth:BoxFit.cover,
        ),
        percentage < 0.24 && height < maxWidth - 10
            ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          widget.selectedVideo!.title,
                          style: Theme.of(context).textTheme.labelMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          widget.selectedVideo!.author.username,
                          style: Theme.of(context).textTheme.labelMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        // percentage < 0.5
        //     ?
        Visibility(
          visible: height<widget._minHeight+50,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow),
          ),
        ),
        // :  Container(),
        // percentage<0.5?
        Visibility(
          visible: height < widget._minHeight + 50,
          child: IconButton(
            onPressed: () {
              ref.read(selectedeVideoProvider.notifier).state = null;
            },
            icon: const Icon(Icons.cancel),
          ),
        )

        // :  Container(),
      ],
    );
  }

  Widget buildMiniPlayer(double height, double percentage) {
    if (widget.selectedVideo == null) return const SizedBox.shrink();

    return Container(
      width: 100,
      height: height,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: percentage < 0.20
          ? _buildMiniPlayerContent(context, height, percentage)
          : const VideoScreen(),
    );
  }
}
