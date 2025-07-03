import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_list_tile.dart';
import '../../core/routing/route_names.dart';
import '../../core/constants/text_styles.dart';

class FlightDataScreen extends ConsumerWidget {
  const FlightDataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uçuş Verileri', style: TextStyles.appBarTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CustomListTile(
            icon: Icons.warning,
            title: "İrtifa İhlali",
            subtitle: "Limit: 1500m - Mevcut: 1650m",
            trailingText: "+150m",
            statusColor: Colors.red,
            onTap: () => context.push(RouteNames.violationDetail),
          ),
          CustomListTile(
            icon: Icons.warning,
            title: "Hız İhlali",
            subtitle: "Limit: 30km/h - Mevcut: 42km/h",
            trailingText: "+12km/h",
            statusColor: Colors.orange,
            onTap: () => context.push(RouteNames.violationDetail),
          ),
          CustomListTile(
            icon: Icons.warning_amber,
            title: "Bölge Sınırı",
            subtitle: "İzinli bölge dışına çıkış",
            trailingText: "",
            statusColor: Colors.yellow,
            onTap: () => context.push(RouteNames.violationDetail),
          ),
        ],
      ),
    );
  }
}