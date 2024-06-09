import 'package:you_tube_clone/widgets.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoInfo extends StatelessWidget {
  final Video video;
  const VideoInfo({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(left:12.0), 
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(video.title,style: Theme.of(context).textTheme.titleLarge,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,),
          Text('${video.viewCount} • ${timeago.format(video.timestamp)} ',
          style: Theme.of(context).textTheme.labelLarge,)
        ],
           ),
     );
  }
}