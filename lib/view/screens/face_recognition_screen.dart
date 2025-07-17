// lib/view/screens/face_recognition_screen.dart
import 'package:flutter/material.dart';
import '../../core/constants/text_styles.dart';

class FaceRecognitionScreen extends StatelessWidget {
  const FaceRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pilot Giriş / Yüz Tanıma', style: TextStyles.appBarTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.face_retouching_natural, size: 80, color: Colors.blueAccent),
            const SizedBox(height: 20),
            Text(
              'Yüz tanıma modülü burada başlayacak.',
              style: TextStyles.bodyText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Yüz tanıma iş akışını başlat
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(200, 50),
              ),
              child: const Text('Yüz Tanımayı Başlat', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
