import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../theme/app_theme.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Position? _currentPosition;
  bool _isLoading = true;

  // موقع افتراضي في صنعاء (باب اليمن) في حال فشل الـ GPS
  static const LatLng _defaultLocation = LatLng(15.3521, 44.2152);

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  // دالة طلب الإذن وجلب الموقع الحالي
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() => _isLoading = false);
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() => _isLoading = false);
        return;
      }
    }

    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = position;
      _isLoading = false;
    });

    if (_mapController != null && position != null) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(position.latitude, position.longitude), 15),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('خرائط فلكس يمن', style: TextStyle(color: AppTheme.goldColor, fontSize: 18)),
        backgroundColor: const Color(0xFF1E1E1E),
        centerTitle: true,
      ),
      body: _isLoading 
        ? const Center(child: CircularProgressIndicator(color: AppTheme.goldColor))
        : Stack(
            children: [
              GoogleMap(
                onMapCreated: (controller) => _mapController = controller,
                initialCameraPosition: CameraPosition(
                  target: _currentPosition != null 
                      ? LatLng(_currentPosition!.latitude, _currentPosition!.longitude)
                      : _defaultLocation,
                  zoom: 14,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                // هنا يمكن إضافة الـ Markers الخاصة بالمنتجات
                markers: {
                  if (_currentPosition != null)
                    Marker(
                      markerId: const MarkerId('my_pos'),
                      position: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                      infoWindow: const InfoWindow(title: 'موقعي الحالي'),
                    ),
                },
              ),
              
              // زر العودة لموقعي الحالي (تصميم ذهبي)
              Positioned(
                bottom: 120,
                right: 20,
                child: FloatingActionButton(
                  backgroundColor: AppTheme.goldColor,
                  onPressed: _determinePosition,
                  child: const Icon(Icons.my_location, color: Colors.black),
                ),
              ),
            ],
          ),
    );
  }
}
