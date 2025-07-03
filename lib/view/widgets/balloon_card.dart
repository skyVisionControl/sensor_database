import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/text_styles.dart';

class BalloonCard extends StatelessWidget {
  final String title;
  final String value;

  const BalloonCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColors.card,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyles.cardTitle),
            const SizedBox(height: 8),
            Text(value, style: TextStyles.bodyText),
          ],
        ),
      ),
    );
  }
}