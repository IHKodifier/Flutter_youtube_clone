import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/widgets.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:you_tube_clone/widgets/custom_miniplayer.dart';

final selectedeVideoProvider = StateProvider<Video?>((ref) => null);

class VideoCard extends ConsumerWidget {
  const VideoCard(this.video, {super.key});
  final Video video;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedeVideoProvider.notifier).state = video;
        ref.read(miniPlayerControllerProvider).animateToHeight(
          // height: 250,
              state: PanelState.MAX,
              // duration: Duration(microseconds: 120,
              // ),
            );
         
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          surfaceTintColor: Colors.grey.shade50,
         shadowColor: Colors.red,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        video.thumbnailUrl,
                        height: 240,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12.0,
                    right: 8.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black87,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2),
                        child: Text(
                          video.duration,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        foregroundImage: NetworkImage(
                          video.author.profileImageUrl,
                        ),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          video.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                            '${video.author.username}  |  ${video.viewCount} views  |  ${timeago.format(video.timestamp)}'),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      child: const Icon(
                    Icons.more_vert,
                    size: 20,
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
