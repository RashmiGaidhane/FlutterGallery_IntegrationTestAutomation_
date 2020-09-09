import 'package:flutter_driver/flutter_driver.dart';

class HomeScreen {
  final imgShrineCard = find.byValueKey('shrine@study');

  FlutterDriver _driver;
  Duration timeout = const Duration(seconds: 5);

  //Constructor for initialization the Flutter driver
  HomeScreen(FlutterDriver driver) {
    _driver = driver;
  }

  Future<void> verifyShrineCard() async {
    print('The application launched sucessfully...');
    await _driver.waitFor(imgShrineCard, timeout: timeout);
  }

  Future<void> tapShrineCard() async {
    print('Tap on Shrine Card Image...');
    return _driver.tap(imgShrineCard);
  }
}
