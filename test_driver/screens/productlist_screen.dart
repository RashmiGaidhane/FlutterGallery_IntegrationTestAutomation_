import 'package:flutter_driver/flutter_driver.dart';

class ProductListScreen {
  final lstproducts = find.byValueKey('Products');
  final txtClothingProduct = find.text('Walter henley (white)');
  final txtAccessoriesProduct = find.text('Shrug bag');

  FlutterDriver _driver;

  //Constructor for initialization the Flutter driver
  ProductListScreen(FlutterDriver driver) {
    _driver = driver;
  }

  Future<String> getProductList() async {
    return _driver.getText(lstproducts);
  }

  Future<void> tapProductClothingItem() async {
    print('Tap on clothing prodcuct item on product list screen...');
    return await _driver.tap(txtClothingProduct);
  }

  Future<void> tapProductAccessoriesItem() async {
    print('Tap on accessories prodcuct item on product list screen...');
    return await _driver.tap(txtAccessoriesProduct);
  }

  Future<void> waitForProductList() async {
    print('Wait to load product list screen...');
    return _driver.waitFor(lstproducts);
  }
}
