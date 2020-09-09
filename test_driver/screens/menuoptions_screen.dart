import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

class MenuOptionsScreen {
  final mnuOptionClothing = find.text('CLOTHING');
  final mnuOptionAccessories = find.text('ACCESSORIES');

  FlutterDriver _driver;

  //Constructor for initialization the Flutter driver
  MenuOptionsScreen(FlutterDriver driver) {
    _driver = driver;
  }

  Future<void> waitForClothingOptionTxt() async {
    print('Wait to load Shrine Menu options screen...');
    return _driver.waitFor(mnuOptionClothing);
  }

  Future<void> isClothingTxtAvailable() async {
    print('Validate Clothing text is available on Menu Options screen...');
    expect(await _driver.getText(mnuOptionClothing), isNotEmpty);
    expect(await _driver.getText(mnuOptionClothing), 'CLOTHING');
  }

  Future<void> tapClothingOptionTxt() async {
    //Return text of Next button
    print('Tap on CLOTHING Menu option text...');
    return await _driver.tap(mnuOptionClothing);
  }

  Future<void> waitForAccessoriesOptionTxt() async {
    print('Wait to load Shrine Menu options screen...');
    return _driver.waitFor(mnuOptionAccessories);
  }

  Future<void> isAccessoriesTxtAvailable() async {
    print('Validate accessories text is available on Menu Options screen...');
    expect(await _driver.getText(mnuOptionAccessories), isNotEmpty);
    expect(await _driver.getText(mnuOptionAccessories), 'ACCESSORIES');
  }

  Future<void> tapAccessoriesOptionTxt() async {
    //Return text of Next button
    print('Tap on ACCESSORIES Menu option text...');
    return await _driver.tap(mnuOptionAccessories);
  }
}
