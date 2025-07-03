import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/route_names.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/text_styles.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canlı Konumlar', style: TextStyles.appBarTitle),
      ),
      body: Stack(
        children: [
          // Harita görünümü (simülasyon)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/map_background.jpg'), // Gerçek projede harita servisi
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Balon konumları
          Positioned(
            top: 100,
            left: 150,
            child: _buildBalloonMarker("BAL-001", () => context.push(RouteNames.balloonDetail)),
          ),
          Positioned(
            top: 250,
            left: 200,
            child: _buildBalloonMarker("BAL-002", () => context.push(RouteNames.balloonDetail)),
          ),
          Positioned(
            top: 180,
            left: 300,
            child: _buildBalloonMarker("BAL-003", () => context.push(RouteNames.balloonDetail)),
          ),
        ],
      ),
    );
  }

  Widget _buildBalloonMarker(String id, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          const Icon(Icons.location_on, size: 40, color: Colors.red),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(id, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}