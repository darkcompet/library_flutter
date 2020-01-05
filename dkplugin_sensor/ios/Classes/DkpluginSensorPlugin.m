#import "DkpluginSensorPlugin.h"
#import <dkplugin_sensor/dkplugin_sensor-Swift.h>

@implementation DkpluginSensorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDkpluginSensorPlugin registerWithRegistrar:registrar];
}
@end
