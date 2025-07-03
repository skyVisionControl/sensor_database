import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/routing/route_names.dart';
import '../widgets/custom_list_tile.dart';
import '../../core/constants/text_styles.dart';

class CaptainInfoScreen extends ConsumerWidget {
  const CaptainInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilot Bilgileri', style: TextStyles.appBarTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CustomListTile(
            icon: Icons.flight,
            title: "ABC Hava Taşımacılık",
            subtitle: "Pilot: Ahmet Yılmaz",
            trailingText: "12 kişi",
            statusColor: Colors.green,
            onTap: () => context.push(RouteNames.flightDetails),
          ),
          CustomListTile(
            icon: Icons.flight,
            title: "XYZ Balon Turu",
            subtitle: "Pilot: Mehmet Kaya",
            trailingText: "8 kişi",
            statusColor: Colors.orange,
            onTap: () => context.push(RouteNames.flightDetails),
          ),
          CustomListTile(
            icon: Icons.flight,
            title: "Gökyüzü Turizm",
            subtitle: "Pilot: Ayşe Demir",
            trailingText: "16 kişi",
            statusColor: Colors.red,
            onTap: () => context.push(RouteNames.flightDetails),
          ),
        ],
      ),
    );
  }
}