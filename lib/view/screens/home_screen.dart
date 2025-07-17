// lib/view/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/route_names.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/text_styles.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('SkyVision Control', style: TextStyles.appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ana Ekran', style: TextStyles.screenTitle),
            const SizedBox(height: 20),
            _buildNavButton(context, 'Uçuş Verileri', RouteNames.flightData),
            _buildNavButton(context, 'Uçuş Detayları', RouteNames.flightDetails),
            _buildNavButton(context, 'Balon Detay', RouteNames.balloonDetail),
            _buildNavButton(context, 'Pilot Bilgisi', RouteNames.captainInfo),
            _buildNavButton(context, 'Konum', RouteNames.location),
            _buildNavButton(context, 'İhlal Detay', RouteNames.violationDetail),
            _buildNavButton(context, 'Kaptan Tanımlama', RouteNames.captainIdentification),
            // Eski yüz tanıma ekranı
            _buildNavButton(context, 'Pilot Giriş / Yüz Tanıma', RouteNames.faceRecognition),
            // Yeni mobil yüz tanıma ekranı
            _buildNavButton(context, 'Mobil Yüz Tanıma', RouteNames.mobileFaceDetection),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String text, String route) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.button,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: () => context.push(route),
        
        child: Text(text, style: TextStyles.buttonText),
      ),
    );
  }
}
