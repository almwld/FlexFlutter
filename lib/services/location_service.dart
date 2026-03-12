import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService {
  // الحصول على الموقع الحالي
  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }

  // تحويل الإحداثيات لعنوان
  static Future<String> getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return '${place.locality}, ${place.country}';
      }
    } catch (e) {
      print(e);
    }
    return 'موقع غير معروف';
  }

  // مدن اليمن مع إحداثياتها
  static final Map<String, LatLng> yemenCities = {
    'صنعاء': const LatLng(15.3694, 44.1910),
    'عدن': const LatLng(12.7855, 45.0185),
    'تعز': const LatLng(13.5795, 44.0209),
    'الحديدة': const LatLng(14.7979, 42.9545),
    'المكلا': const LatLng(14.5424, 49.1259),
    'إب': const LatLng(13.9667, 44.1833),
    'سيئون': const LatLng(15.9333, 48.8000),
    'ذمار': const LatLng(14.5500, 44.4000),
    'عمران': const LatLng(15.6500, 43.9333),
    'البيضاء': const LatLng(13.9833, 45.5667),
    'حجة': const LatLng(15.7000, 43.6000),
    'لحج': const LatLng(13.0564, 44.8781),
    'أبين': const LatLng(13.6667, 45.7333),
    'شبوة': const LatLng(15.5000, 47.1667),
    'مأرب': const LatLng(15.4667, 45.3167),
    'الجوف': const LatLng(16.6667, 44.4167),
    'صعدة': const LatLng(16.9333, 43.7667),
    'حضرموت': const LatLng(16.0000, 49.5000),
    'المهرة': const LatLng(16.7500, 51.5000),
    'سقطرى': const LatLng(12.5000, 54.0000),
  };
}
