class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User currentUser = User(
  username: 'Google',
  profileImageUrl:
      'https://yt3.googleusercontent.com/viNp17XpEF-AwWwOZSj_TvgobO1CGmUUgcTtQoAG40YaYctYMoUqaRup0rTxxxfQvWw3MvhXesw=s176-c-k-c0x00ffffff-no-rj',
  subscribers: '900K',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;

  const Video({
    required this.id,
    required this.author,
    required this.title,
    required this.thumbnailUrl,
    required this.duration,
    required this.timestamp,
    required this.viewCount,
    required this.likes,
    required this.dislikes,
  });
}

final List<Video> videos = [
  // TODO: update
  Video(
    id: 'x606y4QWrxo',
    author: currentUser,
    title: 'Flutter Clubhouse Clone UI Tutorial | Apps From Scratch',
    thumbnailUrl: 'https://i.ytimg.com/vi/x606y4QWrxo/0.jpg',
    duration: '8:20',
    timestamp: DateTime(2021, 3, 20),
    viewCount: '10K',
    likes: '958',
    dislikes: '4',
  ),
  // TODO: update
  Video(
    author: currentUser,
    id: 'vrPk6LB9bjo',
    title:
        'Build Flutter Apps Fast with Riverpod, Firebase, Hooks, and Freezed Architecture ',
    thumbnailUrl: 'https://i.ytimg.com/vi/vrPk6LB9bjo/0.jpg',
    duration: '22:06',
    timestamp: DateTime(2021, 2, 26),
    viewCount: '8K',
    likes: '485',
    dislikes: '8',
  ),
  // TODO: update
  Video(
    id: 'ilX5hnH8XoI',
    author: currentUser,
    title: 'Flutter Instagram Stories',
    thumbnailUrl: 'https://i.ytimg.com/vi/ilX5hnH8XoI/0.jpg',
    duration: '10:53',
    timestamp: DateTime(2020, 7, 12),
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
  ),
];
final List<Video> shorts = [
  Video(
    id: 'kCBKCcRbOwY',
    author: currentUser,
    title: 'Stability test of Toyota Prado VS Ford Endeavour',
    thumbnailUrl: 'https://i.ytimg.com/vi/kCBKCcRbOwY/oardefault.jpg?sqp=-oaymwEdCJUDENAFSFWQAgHyq4qpAwwIARUAAIhCcAHAAQY=&rs=AOn4CLDZnpyPDc9CZoWjnON0f7E4THtCXA',
    duration: '01:59',
    timestamp: DateTime(2021, 3, 24),
    viewCount: '18K',
    likes: '1k',
    dislikes: '4',
  ),
  Video(
    id: 'kCBKCcRbOwY',
    author: currentUser,
    title: 'Short 2',
    thumbnailUrl: '',
    duration: '01:32',
    timestamp: DateTime(2019, 1, 11),
    viewCount: '41K',
    likes: '9k',
    dislikes: '53',
  ),


];

final List<Video> suggestedVideos = [
  // TODO: update
  Video(
    id: 'rJKN_880b-M',
    author: currentUser,
    title: 'Flutter Netflix Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl: 'https://i.ytimg.com/vi/rJKN_880b-M/0.jpg',
    duration: '1:13:15',
    timestamp: DateTime(2020, 8, 22),
    viewCount: '32K',
    likes: '1.9k',
    dislikes: '7',
  ),
  // TODO: update
  Video(
    id: 'HvLb5gdUfDE',
    author: currentUser,
    title: 'Flutter Facebook Clone Responsive UI Tutorial | Web and Mobile',
    thumbnailUrl: 'https://i.ytimg.com/vi/HvLb5gdUfDE/0.jpg',
    duration: '1:52:12',
    timestamp: DateTime(2020, 8, 7),
    viewCount: '190K',
    likes: '9.3K',
    dislikes: '45',
  ),
  // TODO: update
  Video(
    id: 'h-igXZCCrrc',
    author: currentUser,
    title: 'Flutter Chat UI Tutorial | Apps From Scratch',
    thumbnailUrl: 'https://i.ytimg.com/vi/h-igXZCCrrc/0.jpg',
    duration: '1:03:58',
    timestamp: DateTime(2019, 10, 17),
    viewCount: '358K',
    likes: '20k',
    dislikes: '85',
  ),
];
List<String> chips = [
  'All',
  'New to you',
  'Computers',
  'Flutter',
  'Sports',
  'Aaana',
  'Kabaaana',
  'Titaaaana',
  'New tro you',
];
