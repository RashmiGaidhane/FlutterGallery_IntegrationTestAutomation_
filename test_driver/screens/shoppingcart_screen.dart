import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:test/test.dart';

class ShoppingCartScreen {
  final btnClearCart = find.text('CLEAR CART');
  final txtCartTotal = find.text('TOTAL');
  final txtTotalCost = find.byValueKey('Total Cost');

  FlutterDriver _driver;

  //Constructor for initialization the Flutter driver
  ShoppingCartScreen(FlutterDriver driver) {
    _driver = driver;
  }

  Future<void> waitForClearCard() async {
    print('Wait to load Cart screen...');
    return _driver.waitFor(btnClearCart);
  }

  Future<void> verifyClearCartTxt() async {
    print('Validate the clear cart text is not empty');
    expect(await _driver.getText(btnClearCart), isNotEmpty);
    expect(await _driver.getText(btnClearCart), 'CLEAR CART');
  }

  Future<void> isEmptyTotalCost() async {
    print('Validate the Total is not empty');
    var TOTAL = await _driver.getText(txtTotalCost);
    //Print Total Cost value
    print('The total cost of the added items.....${TOTAL},');
    expect(await _driver.getText(txtTotalCost), isNotEmpty);
  }

  Future<void> tapClearCart() async {
    print('Tap on Clear cart to cleared all the previously added items');
    return _driver.tap(btnClearCart);
  }

  Future<String> getTotalCostTxt() async {
    print('Get Todat Cost of the added product items....');
    return  _driver.getText(txtTotalCost);
  }
}
