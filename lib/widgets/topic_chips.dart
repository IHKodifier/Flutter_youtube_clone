import 'package:you_tube_clone/widgets.dart';

class TopicChips extends StatelessWidget {
  const TopicChips({
    super.key,
    required this.chipList,
  });

  final List<Container> chipList;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 80.0, 
        child: ListView(scrollDirection: Axis.horizontal, children: [
          const SizedBox(
            width: 12,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Icon(Icons.explore),
          ),
          ...chipList
        ]),
      ),
    );
  }
}
