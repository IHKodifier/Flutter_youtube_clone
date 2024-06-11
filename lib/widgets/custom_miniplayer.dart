import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  double maxWidth = 0;

  @override
  void initState() {
    super.initState();
    _opacity = 0.0;
  }

  @override
  @override
  Widget build(BuildContext context) {
    maxWidth = MediaQuery.of(context).size.width;
    return Miniplayer(
      elevation: 15,
      controller: ref.read(miniPlayerControllerProvider),
      minHeight: widget._minHeight,
      maxHeight: MediaQuery.of(context).size.height,
      builder: (height, percentage) {
        if (widget.selectedVideo == null) return const SizedBox.shrink();

        return Container(
          width: 100,
          height: height,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: percentage < 0.30
              ? _buildMiniPlayerContent(context, height, percentage)
              : const VideoScreen(),
        );
      },
    );
  }

  Widget _buildMiniPlayerContent(BuildContext context, height, percentage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: _buildMiniPlayerHeader(context, height, percentage)),
        const LinearProgressIndicator(
          value: 0.22,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        ),
      ],
    );
  }

  Widget _buildMiniPlayerHeader(BuildContext context, height, percentage) {
    print('Heigh = $height\nPercentage = ${percentage * 100}');
    return Row(
      children: [
        Image.network(
          widget.selectedVideo!.thumbnailUrl,
          // height: widget._minHeight + (percentage * 10) - 4,
          width: widget._minHeight+ height * 2,
          fit: BoxFit.cover,
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
          visible: percentage < 0.24,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow),
          ),
        ),
        // :  Container(),
        // percentage<0.5?
        Visibility(
          visible: percentage < 0.24,
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
}
