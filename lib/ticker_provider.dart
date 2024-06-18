import 'package:flutter/scheduler.dart';
import 'package:you_tube_clone/widgets.dart';

class MyTickerProvider extends ChangeNotifier implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
