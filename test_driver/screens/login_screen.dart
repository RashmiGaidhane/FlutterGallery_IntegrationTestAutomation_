import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

class LoginScreen {
  final btnNext = find.text('NEXT');

  FlutterDriver _driver;

  //Constructor for initialization the Flutter driver
  LoginScreen(FlutterDriver driver) {
    _driver = driver;
  }

  Future<void> waitForNextButton() async {
    print('Wait to load Shrine Login screen...');
    return await _driver.waitFor(btnNext);
  }

  Future<void> isNextBtnAvailable() async {
    print('Validate Next button is available on Shrine login screen...');
    expect(await _driver.getText(btnNext), isNotEmpty);
    expect(await _driver.getText(btnNext), 'NEXT');
  }

  Future<void> tapNextBtn() async {
    //Return text of Next button
    print('Tap on Next button on Shrine Login screen...');
    return await _driver.tap(btnNext);
  }
}
