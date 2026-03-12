import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../theme/app_theme.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const CameraPosition _yemenCenter = CameraPosition(target: LatLng(15.3694, 44.1910), zoom: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('استكشف القريب منك')),
      body: Stack(
        children: [
          const GoogleMap(
            initialCameraPosition: _yemenCenter,
            myLocationEnabled: true,
            mapType: MapType.normal,
          ),
          // شريط بحث فوق الخريطة
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: const TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(hintText: 'ابحث عن مطعم، متجر، أو عقار...', border: InputBorder.none, icon: Icon(Icons.search)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
