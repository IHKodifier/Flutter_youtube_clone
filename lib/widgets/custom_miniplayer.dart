// ignore_for_file: avoid_print

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
  // double _opacity = 0.0;
  double maxWidth = 0;
  double _currentWidth = 150;

  @override
  void initState() {
    super.initState();
    // _opacity = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    maxWidth = MediaQuery.of(context).size.width;
    return Miniplayer(
      elevation: 15,
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
     if (height > widget._minHeight + 1) {
      // setState(() {
        _currentWidth =
            maxWidth-8; // Update the width to maxWidth when the condition is met 
      // });
    } else {
      // setState(() {
        _currentWidth = widget._minHeight +
            height; // Otherwise, set it based on the height
      // });
    }
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 600), // Set the  animation duration
          width: _currentWidth, // Use the state variable for width
          child: Image.network(
            widget.selectedVideo!.thumbnailUrl,
            fit: BoxFit.cover,
          ),
        ),
        percentage < 0.24 && _currentWidth < maxWidth - 10
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
  
      _currentWidth < maxWidth - 10?
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
             
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow),
              ),
              IconButton(
            onPressed: () {
              ref.read(selectedeVideoProvider.notifier).state = null;
            },
            icon: const Icon(Icons.cancel),
          )
            ],
          ),
        ):Container(),
        // :  Container(),
        // percentage<0.5?
        

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
