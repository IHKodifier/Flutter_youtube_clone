import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/widgets.dart';

class VideoScreen extends ConsumerWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final video = ref.read(selectedeVideoProvider);
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
                        onTap: (){},
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
                VideoInfo(video: video,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

