import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/widgets.dart';

class ShortsScreen extends ConsumerWidget {
  const ShortsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = PageController(initialPage: 0,
    );
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text('shorts'),
        )
      ],
    );
  }
}
