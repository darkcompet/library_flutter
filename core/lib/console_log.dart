import 'build_config.dart';

class DkLogs {
   static void _log(bool invalidInReleaseMode, String type, String msg) {
      if (DkBuildConfig.RELEASE && invalidInReleaseMode) {
         throw "Cannot use log of $type in release mode";
      }
      print(msg);
   }

   static String _makePrefix(where) {
      return "$where~ ";
   }

   static void debug(where, String msg) {
      _log(false, "debug", "_____ ${_makePrefix(where)} $msg");
   }

   static void log(where, String msg) {
      _log(false, "info", _makePrefix(where) + msg);
   }

   static void logw(where, String msg) {
      _log(true, "warning", _makePrefix(where) + msg);
   }

   static void loge(where, Exception e) {
      _log(true, "error", _makePrefix(where) + e.toString());
   }
}
