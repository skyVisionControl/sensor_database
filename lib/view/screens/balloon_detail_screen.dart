// lib/view/screens/balloon_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../repository/repository_providers.dart';
import '../../model/sensor_data.dart';
import '../../core/routing/route_names.dart';   //  '/' path’ini almak için

class BalloonDetailScreen extends ConsumerWidget {
  const BalloonDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sensorAsync = ref.watch(sensorStreamProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // 1) Geri gidilebiliyorsa pop
            if (GoRouter.of(context).canPop()) {
              context.pop();
            } else {
              // 2) Aksi hâlde ana sayfaya git
              context.go(RouteNames.home);
            }
          },
        ),
        title: const Text('Balon Detay'),
      ),
      body: sensorAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Hata: $e')),
        data: (SensorData d) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Sıcaklık:  ${d.temperature.toStringAsFixed(2)} °C',
                style: const TextStyle(fontSize: 20)),
            Text('Basınç:    ${d.pressure.toStringAsFixed(2)} mbar',
                style: const TextStyle(fontSize: 20)),
            Text('Roll:      ${d.roll.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20)),
            Text('Pitch:     ${d.pitch.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20)),
            Text('Yaw:       ${d.yaw.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20)),
            if (d.lat != null && d.lng != null) ...[
              const SizedBox(height: 12),
              Text('Enlem:     ${d.lat}',
                  style: const TextStyle(fontSize: 20)),
              Text('Boylam:    ${d.lng}',
                  style: const TextStyle(fontSize: 20)),
              Text('İrtifa:    ${d.altitude?.toStringAsFixed(0) ?? '-'} m',
                  style: const TextStyle(fontSize: 20)),
              Text('Hız:       ${d.speed?.toStringAsFixed(1) ?? '-'} km/h',
                  style: const TextStyle(fontSize: 20)),
            ],
          ],
        ),
      ),
    );
  }
}
