import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

class TopMenuBarScreen {
  final txtShrine = find.text('SHRINE');
  final mnuMenuBar = find.byTooltip('Open menu');
  final mnuSearchIcon = find.byTooltip('Search');

  FlutterDriver _driver;

  //Constructor for initialization the Flutter driver
  TopMenuBarScreen(FlutterDriver driver) {
    _driver = driver;
  }

  Future<void> tapMenuBarBtn() async {
    //Return text of Next button
    print('Tap on Menu bar button...');
    return await _driver.tap(mnuMenuBar);
  }

  Future<void> waitForShrineTxt() async {
    print('Wait to load product list screen...');
    return _driver.waitFor(txtShrine);
  }

  Future<void> isShrineTxtAvailable() async {
    print('Validate SHRINE title text on Menu top bar...');
    expect(await _driver.getText(txtShrine), isNotEmpty);
    expect(await _driver.getText(txtShrine), 'SHRINE');
  }
}
