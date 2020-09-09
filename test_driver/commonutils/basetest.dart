import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'isolates_workaround.dart';

FlutterDriver driver;

void basetest() {
  IsolatesWorkaround workaround;
  //Connect to the Flutter driver before running any tests.

  setUpAll(() async {
    //Pre-requisites to run the test - up the driver and launch the application
    driver = await FlutterDriver.connect();
    //Workaround for incorrect app behavior.
    final isWeb = await driver.requestData('isWeb') == 'true';
    if (!isWeb) {
      workaround = IsolatesWorkaround(driver);
      await workaround.resumeIsolates();
    }
  });

  //check the health status of our Flutter Driver extension
  test('check flutter driver health', () async {
    final health = await driver.checkHealth();
    expect(health.status, HealthStatus.ok);
    print(health.status);
  });

  //Disconnect from the app
  tearDownAll(() async {
    if (driver != null) {
      await driver.close();
      print('The driver is close now....');
    }
  });
}
