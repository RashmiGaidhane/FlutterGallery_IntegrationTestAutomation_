import 'dart:io' show sleep;

import 'package:test/test.dart';

import '../../../commonutils/basetest.dart';
import '../../../screens/bottonmenubar_section.dart';
import '../../../screens/home_screen.dart';
import '../../../screens/login_screen.dart';
import '../../../screens/menuoptions_screen.dart';
import '../../../screens/productlist_screen.dart';
import '../../../screens/shoppingcart_screen.dart';
import '../../../screens/topmenubar_section.dart';

//main class to execute test steps
Future<void> main() {
  //Calling besttest class for basic setup activities
  basetest();
  //execution of test steps under 'Regression Test Suite' group
  group('regression_test_suite', () {
    test('test1', () async {
      //Instantiate screens using with flutter driver as parameter
      var homeScreen = HomeScreen(driver);
      var loginScreen = LoginScreen(driver);
      var productListScreen = ProductListScreen(driver);
      var bottomMenuBarScreen = BottomMenuBarScreen(driver);
      var topMenuBarScreen = TopMenuBarScreen(driver);
      var menuOptionsScreen = MenuOptionsScreen(driver);
      var shoppingCartScreen = ShoppingCartScreen(driver);

      //Validate user is on home screen of the application
      await homeScreen.verifyShrineCard();
      //Opening the Shrine Gallery by tapping on it.
      await homeScreen.tapShrineCard();
      //Wait to load Shrine Login screen
      await loginScreen.waitForNextButton();
      //Validate Next button on Shrine login screen
      await loginScreen.isNextBtnAvailable();
      //Tap on NEXT button
      await loginScreen.tapNextBtn();
      //Wait to load the product list screen
      await topMenuBarScreen.waitForShrineTxt();
      //Validate Shrine text on top menu bar section
      await topMenuBarScreen.isShrineTxtAvailable();
      //Tap on Menu bar from left side top most corner
      await topMenuBarScreen.tapMenuBarBtn();
      //Wait to load Menu Options screen
      await menuOptionsScreen.waitForClothingOptionTxt();
      //Validate Menu options - CLOTHING is available or not
      await menuOptionsScreen.isClothingTxtAvailable();
      //Select clothing menu option
      await menuOptionsScreen.tapClothingOptionTxt();
      //Scroll to get product Walter henley (white)
      await driver.scrollUntilVisible(
        productListScreen.lstproducts,
        productListScreen.txtClothingProduct,
        dxScroll: -500,
        alignment: 0.5,
        timeout: const Duration(seconds: 10),
      );
      // Verify that the item contains the correct text.
      expect(
        await driver.getText(productListScreen.txtClothingProduct),
        'Walter henley (white)',
      );
      //Tap on product - Walter henley (white)
      await productListScreen.tapProductClothingItem();
      //To load the screen after item adding action
      sleep(const Duration(seconds: 2));
      //Tap on Menu bar from left side top most corner
      await topMenuBarScreen.tapMenuBarBtn();
      //Wait to load Menu Options screen
      await menuOptionsScreen.waitForAccessoriesOptionTxt();
      //Validate Menu options - ACCESSORIES is available or not
      await menuOptionsScreen.isAccessoriesTxtAvailable();
      //Select accessories menu option
      await menuOptionsScreen.tapAccessoriesOptionTxt();
      //Scroll to get product Shrug bag
      await driver.scrollUntilVisible(
        productListScreen.lstproducts,
        productListScreen.txtAccessoriesProduct,
        dxScroll: -500,
        alignment: 0.5,
        timeout: const Duration(seconds: 10),
      );
      // Verify that the item contains the correct text.
      expect(
        await driver.getText(productListScreen.txtAccessoriesProduct),
        'Shrug bag',
      );
      //Tap on product - Shrug bag
      await productListScreen.tapProductAccessoriesItem();
      //To load the screen after item adding action
      sleep(const Duration(seconds: 2));
      //Tap on shopping cart icon
      await bottomMenuBarScreen.tapShoppingCard();
      //Wait to load shopping cart screen
      await shoppingCartScreen.waitForClearCard();
      //Validate clear cart is visible
      await shoppingCartScreen.verifyClearCartTxt();
      //Validating the Total of the shopping cart
      await shoppingCartScreen.isEmptyTotalCost();
      //Tap on Clear Cart to clear added items
      await shoppingCartScreen.tapClearCart();
      //Wait to load product list screen
      await productListScreen.waitForProductList();
      //Validate user is on Accessories Product screen.
      await topMenuBarScreen.isShrineTxtAvailable();
    });
  });
}
