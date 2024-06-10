import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/widgets.dart';

class VideoScreen extends ConsumerStatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends ConsumerState<VideoScreen> {
  bool isLiked = false;
  bool isDisliked = false;
  bool isSubscribed = false;
  late List<Video> suggestedVids;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     suggestedVids = suggestedVideos;
  }

  @override
  Widget build(BuildContext context) {
    final video = ref.watch(selectedeVideoProvider);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLiked != isLiked;
                          });
                        },
                        child: Image.network(
                          video!.thumbnailUrl,
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                          left: 8,
                          top: 8,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 35,
                          )),
                    ],
                  ),
                  const LinearProgressIndicator(
                    value: 0.67,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                  VideoInfo(video: video),
                  const Divider(),
                  _AuthorInfo(user: video.author),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final video = suggestedVids[index];
              
                  return VideoCard(video);
                }, childCount: suggestedVids.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  final User user;

  const _AuthorInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade50,
            backgroundImage: NetworkImage(user.profileImageUrl),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.username),
                Text(user.subscribers),
              ],
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text('SUBSCRIBE',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.red,
                      ))),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}
