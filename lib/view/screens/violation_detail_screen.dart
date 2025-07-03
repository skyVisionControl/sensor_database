import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_vision_control/view/widgets/section_tile.dart';
import '../widgets/info_card.dart';
import '../../core/constants/text_styles.dart';

class ViolationDetailScreen extends ConsumerWidget {
  const ViolationDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İhlal Detayı', style: TextStyles.appBarTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        const Center(
        child: Icon(Icons.warning, size: 80, color: Colors.red),
      ),
      const SizedBox(height: 20),
      const SectionTitle(title: "İhlal Bilgileri"),
      const InfoCard(
        title: "İhlal Tipi",
        value: "İrtifa İhlali",
        icon: Icons.type_specimen,
      ),
      const InfoCard(
        title: "Balon ID",
        value: "BAL-2023-0456",
        icon: Icons.airplanemode_active,
      ),
      const InfoCard(
        title: "Pilot",
        value: "Mehmet Kaya",
        icon: Icons.person,
      ),

      const SectionTitle(title: "İhlal Detayları"),
      _buildDetailRow("İzinli Maksimum İrtifa", "1500 m"),
      _buildDetailRow("Ölçülen İrtifa", "1650 m"),
      _buildDetailRow("Fark", "+150 m"),
      _buildDetailRow("Saat", "07:45"),
      _buildDetailRow("Konum", "38.6423, 34.8321"),

      const SectionTitle(title: "Eylemler"),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          minimumSize: const Size(double.infinity, 50),
        ),
        child: const Text("Uyarı Gönder", style: TextStyle(color: Colors.white)),),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text("Rapor Oluştur"),
        ),
        ],
      ),
    ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyles.bodyText),
          Text(value, style: TextStyles.cardTitle),
        ],
      ),
    );
  }
}