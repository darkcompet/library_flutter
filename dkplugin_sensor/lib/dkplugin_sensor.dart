import 'dart:async';

import 'package:flutter/services.dart';

class DkpluginSensor {
	static const MethodChannel _channel =
	const MethodChannel('dkplugin_sensor');

	static Future<String> get platformVersion async {
		final String version = await _channel.invokeMethod('getPlatformVersion');
		return version;
	}
}
