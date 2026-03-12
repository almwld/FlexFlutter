import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../theme/app_theme.dart';

class NearbyAdsScreen extends StatelessWidget {
  const NearbyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إعلانات قريبة منك')),
      body: Stack(
        children: [
          const GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(15.3694, 44.1910), // صنعاء
              zoom: 13,
            ),
            // هنا تضاف الـ Markers الخاصة بالإعلانات
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: _buildAdQuickView(),
          ),
        ],
      ),
    );
  }

  Widget _buildAdQuickView() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.goldColor),
      ),
      child: Row(
        children: [
          Container(width: 60, height: 60, color: Colors.grey[800], child: const Icon(Icons.image, color: Colors.white)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('سيارة تيوتا نظيفة جداً', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('صنعاء - حي حدة', style: TextStyle(color: AppTheme.goldColor, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
        ],
      ),
    );
  }
}
