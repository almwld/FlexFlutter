import 'package:hive_flutter/hive_flutter.dart';

class OfflineService {
  static const String adsBox = 'ads_cache';

  static Future<void> cacheAds(List<dynamic> ads) async {
    var box = await Hive.openBox(adsBox);
    await box.put('latest_ads', ads);
  }

  static Future<List<dynamic>> getCachedAds() async {
    var box = await Hive.openBox(adsBox);
    return box.get('latest_ads', defaultValue: []);
  }
}
