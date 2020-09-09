## ## ## ## Gallery application test automation ## ## ## ## ##

## Getting Started
Demonstrate automation testing of "Flutter Gallery" application in Android with Flutter driver!!
The Goal is to write automated test cases on real devices of "Flutter_Gallary" application. The Source code & binaries are available at " https://github.com/flutter/gallery "

------------------------------------------------------------------------------------------------------------------------------------------------------------
## Requirements
Automate the below
"user is adding some items to the shopping cart" scenario.
For example:
1. Opening the Shrine Gallery
2. Adding the Walter henley (white) shirt to cart after going to the Clothing filter
3. Adding the Shrug bag after using the Accessories filter
4. Checking the total of the shopping cart
5. Clearing the shopping cart

------------------------------------------------------------------------------------------------------------------------------------------------------------
## Tools / Technologies
1. Android Studio
2. Flutter SDK
3. Android SDK
4. adb
5. Dart
6. Debugger tool - Dev Tool/Flutter Inspector

------------------------------------------------------------------------------------------------------------------------------------------------------------
## Setup
1. Download Android SDK and setup as per given steps
2. Download the Flutter SDK and put at desired folder like :C:/Flutter_SDK/
3. Set all the paths in Environment variables
4. Add all necessary plugins
5. adb to connect Android devices
6. Setup DevTool
7. Clone the Flutter Gallery project at desired location
8. Setup project in Android Studio and resolve all dependencies
7. Add below code snippet in pubspec.yaml file
         dev_dependencies:
         flutter_driver:
         sdk: flutter
         test: any
8. Resolve all dependencies from pubspec.yaml
9. Run the main.dart class from lib, to get the code compiled and clean
10. Add "enableFlutterDriverExtension();" in main() of shoppingcartFeature.dart, to enable the flutter extension Also import the import 'package:flutter_driver/driver_extension.dart';

Reference URL: https://flutter.dev/docs/get-started/install

------------------------------------------------------------------------------------------------------------------------------------------------------------
## Structure
1. Used Page Object Model design pattern to automated the integration test of Flutter Gallery app.
2. Under test_driver folder, complete test automation structure follows
    test_driver
        - commonutils
            - basttest.dart
            - isolates_workaround.dart
        - screens
            - home_scree.dart
            - login_screen.dart
            - topmenubar_section.dart
            - menuoptions_screen.dart
            - productlist_screen.dart
            - shoppingcart_screen.dart
            - bottommenubar_section.dart
         - testscripts
            - regressiontestsuite
                - Feature
                    - shoppingcartFeature.dart
                    - shoppingcartFeature_test.dart
                    - loginFeature.dart
            - sanitytestsuite
         - reporting/screenshots

   - basttest.dart : this file contains all common pre-requisites to run the test activities like - Flutter driver initialization & connection, setUpAll, teardown, health of flutter driver, launch of application.
   - isolates_workaround.dart : this file contains the fix for abnormal behaviour of application. Workaround for bug: https://github.com/flutter/flutter/issues/24703
   - home_scree.dart (all files...) : these files provided locators/elements and their methods. It is best practice to maintain the code.
   - shoppingcartFeature.dart : this is use to have instrument the app. Build & install the debug build in targeted attached device.
   - shoppingcartFeature_test.dart : This is test script file which contain execution steps of test scenario.

Picture -
   ![PageObjectModel](img/PageObjectModel.png)

------------------------------------------------------------------------------------------------------------------------------------------------------------
## Execution
1. Connect computer to a real Android device
2. Check the connection by using adb devices on cmd
3. Run the following command from the root of the project - <flutter drive --target=test_driver/testscripts/regressiontestsuite/Features/shoppingcartFeature.dart>
4. Step 3 will install the debug.apk/build in the attached device and then test start execution.
4. Execution happens and logs get generated in Console.

Reference URL: https://flutter.dev/docs/cookbook/testing/integration/introduction

------------------------------------------------------------------------------------------------------------------------------------------------------------
## Reporting
Currently we can see execution in the console window. Used the print command to print the logs. Need to explore how to do reporting for this Integration Test

------------------------------------------------------------------------------------------------------------------------------------------------------------
## Point to be taken
1. Updated some Keys/text locator to access elements of the screens and perform the certain actions
2. More features of Flutter are in the exploration phase.

------------------------------------------------------------------------------------------------------------------------------------------------------------
## Challenges
1. The given applications/ binaries do not have Key values, which is used to find the objects on the screen.
2. Used Appium for automating the test using UI automator, but blocked to get Clothing items on Product list screen, as Widget is not exposing the proper elements.
[Solution]: Locators/elements should get exposed by the developer team.
3. Used Appium Flutter Driver using java/maven project, but import pro.truongsinh.appium_flutter.FlutterFinder; import pro.truongsinh.appium_flutter.finder.FlutterElement; are not working as expected and hence blocked after lunching pplication, nothing happened.
4. Application is not launching properly, working around used as have "isolates_workaround.dart" file
5. More enhancements we can do will require more time.
------------------------------------------------------------------------------------------------------------------------------------------------------------
## Video of test execution

![Flutter Gallery_Test_Automation](video/PageObjectModel.gif)
