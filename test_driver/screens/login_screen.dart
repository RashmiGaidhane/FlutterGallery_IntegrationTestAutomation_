import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../../test_driver/commonutils/testdata_config.dart';

class LoginScreen {
  final btnNext = find.text('NEXT');
  final txtUsername = find.byValueKey('Username');
  final txtPassword = find.byValueKey('Password');

  FlutterDriver _driver;

  //Constructor for initialization the Flutter driver
  LoginScreen(FlutterDriver driver) {
    _driver = driver;
  }

  Future<String> getUsernametxt() async {
    return await _driver.getText(txtUsername);
  }

  Future<String> enterUsernameTxt() async {
    print('Enter username text in Username text box of login screen.....');
     await _driver.tap(txtUsername);
    // await _driver.enterText('abc');
    await _driver.enterText(TestData.USER_NAME);
  }

  Future<String> enterPasswordTxt() async {
    print('Enter password text in Password text box of login screen.....');
    await _driver.tap(txtPassword);
    await _driver.enterText(TestData.PASSWORD);
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
    print('Tap on Next button on login screen...');
    return await _driver.tap(btnNext);
  }
}


