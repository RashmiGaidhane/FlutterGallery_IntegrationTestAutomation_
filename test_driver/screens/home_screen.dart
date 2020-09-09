import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';


class HomeScreen {
  final imgShrineCard = find.byValueKey('shrine@study');
  final txtGallery = find.text('Gallery');


  FlutterDriver _driver;
  Duration timeout = const Duration(seconds: 5);

  //Constructor for initialization the Flutter driver
  HomeScreen(FlutterDriver driver) {
    _driver = driver;
  }

  Future<void> verifyShrineCard() async {
    print('The application launched sucessfully.....');
    await _driver.waitFor(imgShrineCard, timeout: timeout);
  }

  Future<void> tapShrineCard() async {
    print('Tap on Shrine Card image on home screen...');
    return _driver.tap(imgShrineCard);
  }

  Future<void> isGalleryTxtDisplayed() async {
    print('Gallery heading on home screen should be visible to user...');
    expect(await _driver.getText(txtGallery), 'Gallery');
  }
}
