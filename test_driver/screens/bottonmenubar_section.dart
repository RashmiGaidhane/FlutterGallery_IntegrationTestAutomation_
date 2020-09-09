import 'package:flutter_driver/flutter_driver.dart';

class BottomMenuBarScreen {
  final imgShoppingCartIcon = find.byValueKey('Shopping Cart');

  FlutterDriver _driver;

  //Constructor for initialization the Flutter driver
  BottomMenuBarScreen(FlutterDriver driver) {
    _driver = driver;
  }

  Future<void> tapShoppingCard() async {
    print('Tap on shopping cart to open cart screen...');
    return _driver.tap(imgShoppingCartIcon);
  }
}
