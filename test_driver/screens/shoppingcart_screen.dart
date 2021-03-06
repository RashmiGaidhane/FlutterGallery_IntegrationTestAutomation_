import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import '../commonutils/basetest.dart';
import 'productlist_screen.dart';

class ShoppingCartScreen {
  final btnClearCart = find.text('CLEAR CART');
  final txtCartTotal = find.text('TOTAL');
  final txtTotalCost = find.byValueKey('Total Cost');
  final txtNoItems = find.text('NO ITEMS');

  FlutterDriver _driver;
  var productListScreen = ProductListScreen(driver);

  //Constructor for initialization the Flutter driver
  ShoppingCartScreen(FlutterDriver driver) {
    _driver = driver;
  }

  Future<void> waitForClearCard() async {
    print('Wait to load Cart screen...');
    return _driver.waitFor(btnClearCart);
  }

  Future<void> verifyClearCartTxt() async {
    print('Validate the button CLEAR CART');
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
    print('Tap on CLEAR CART button to cleared all the previously added items');
    return _driver.tap(btnClearCart);
  }

  Future<String> getTotalCostTxt() async {
    print('Get Todat Cost of the added product items....');
    return _driver.getText(txtTotalCost);
  }

  Future<void> verifyShoppingCartIsEmpty() async {
    print(
        'Validate shopping cart is empty......[by validating NO ITEMS text, \$0.00 & no clothing and accsserios product items]....');
    var TOTAL = await _driver.getText(txtTotalCost);
    //Print Total Cost value
    print('The total cost of the added items.....${TOTAL},');
    // ignore: prefer_single_quotes
    expect(await _driver.getText(txtTotalCost), '\$0.00');
    print('NO ITEMS text is found.....');
    expect(await _driver.getText(txtNoItems), isNotEmpty);
    expect(await _driver.getText(txtNoItems), 'NO ITEMS');
  }
}
