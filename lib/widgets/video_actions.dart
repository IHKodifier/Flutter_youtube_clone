import 'package:you_tube_clone/widgets.dart';

class VideoActions extends StatelessWidget {
  const VideoActions({super.key, required this.video});
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Icon(
                Icons.thumb_up_outlined,
              ),
              const SizedBox(height: 6),
             
              Text(video.likes),
            ], 
          ),
          Column(
            children: [
              const Icon(
                Icons.thumb_down_alt_outlined,
              ),
              const SizedBox(height: 6),
              Text(video.dislikes),
            ],
          ),
          const Column(
            children: [
              Icon(
                Icons.reply,
              ),
               const SizedBox(height: 6),
       
              Text('Share'),
            ],
          ),
          const Column(
            children: [
              Icon(
                Icons.download_outlined,
              ),
              Text('Download'),
            ],
          ),
          const Column(children: [
            Icon(
              Icons.library_add_outlined,
            ),
            Text('Save'),
            
          ]),
        ],
      ),
    );
  }
}
