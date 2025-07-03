import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_vision_control/view/widgets/section_tile.dart';
import '../widgets/info_card.dart';
import '../../core/constants/text_styles.dart';

class FlightDetailsScreen extends ConsumerWidget {
  const FlightDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uçuş Detayları', style: TextStyles.appBarTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: "Sistem Durumu"),
            const InfoCard(
              title: "Balon Durumu",
              value: "Normal",
              icon: Icons.airplanemode_active,
            ),

            const SectionTitle(title: "Uçuş Süresi Bilgileri"),
            Row(
              children: const [
                Expanded(
                  child: InfoCard(
                    title: "Başlangıç",
                    value: "06:45",
                    icon: Icons.timer,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InfoCard(
                    title: "Tahmini Bitiş",
                    value: "08:30",
                    icon: Icons.timer_off,
                  ),
                ),
              ],
            ),

            const SectionTitle(title: "Pilot Durumu"),
            const InfoCard(
              title: "Pilot Durumu",
              value: "Aktif",
              icon: Icons.person,
            ),

            const SectionTitle(title: "Uçuş Öncesi Kontroller"),
            _buildCheckItem("Hava Şartları Kontrolü", true),
            _buildCheckItem("Yakıt Seviyesi", true),
            _buildCheckItem("Rüzgar Analizi", false),
            _buildCheckItem("Yolcu Güvenlik Brifingi", true),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckItem(String text, bool isChecked) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Checkbox(value: isChecked, onChanged: (_) {}),
          Text(text, style: TextStyles.bodyText),
        ],
      ),
    );
  }
}