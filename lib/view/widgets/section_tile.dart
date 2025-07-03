import 'package:flutter/material.dart';
import '../../core/constants/text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyles.cardTitle.copyWith(fontSize: 20),
      ),
    );
  }
}