import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_vision_control/view/widgets/section_tile.dart';
import '../widgets/info_card.dart';
import '../../core/constants/text_styles.dart';

class BalloonDetailScreen extends ConsumerWidget {
  const BalloonDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Balon Detayları', style: TextStyles.appBarTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(Icons.air, size: 40, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text("BAL-2023-0456", style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              )),
            ),
            const SizedBox(height: 30),

            const SectionTitle(title: "Sensör Verileri"),
            Row(
              children: const [
                Expanded(
                  child: InfoCard(
                    title: "İrtifa",
                    value: "1420 m",
                    icon: Icons.height,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InfoCard(
                    title: "Hız",
                    value: "28 km/h",
                    icon: Icons.speed,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Expanded(
                  child: InfoCard(
                    title: "Sıcaklık",
                    value: "18°C",
                    icon: Icons.thermostat,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InfoCard(
                    title: "Rüzgar",
                    value: "12 km/h",
                    icon: Icons.air,
                  ),
                ),
              ],
            ),

            const SectionTitle(title: "Uçuş Bilgileri"),
            const InfoCard(
              title: "Pilot",
              value: "Ahmet Yılmaz",
              icon: Icons.person,
            ),
            const InfoCard(
              title: "Başlangıç Saati",
              value: "06:45",
              icon: Icons.timer,
            ),
            const InfoCard(
              title: "Tahmini Süre",
              value: "105 dk",
              icon: Icons.timer_outlined,
            ),

            const SectionTitle(title: "Konum Bilgisi"),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(child: Text("Harita Görünümü")),
            ),
          ],
        ),
      ),
    );
  }
}