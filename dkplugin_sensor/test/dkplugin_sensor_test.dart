import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dkplugin_sensor/dkplugin_sensor.dart';

void main() {
  const MethodChannel channel = MethodChannel('dkplugin_sensor');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DkpluginSensor.platformVersion, '42');
  });
}
