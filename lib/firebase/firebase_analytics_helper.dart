import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsHelper {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  static Future<void> logEvent(final String name, final Map<String, dynamic> parameters) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  static Future<void> sendScreenViewLog(final String screenName) async {
    await logEvent('screen_view', <String, dynamic>{'screen_name': screenName});
  }
}
