import 'package:flutter/material.dart';
import 'face_detection_screen.dart';

class CaptainIdentificationScreen extends StatelessWidget {
  const CaptainIdentificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kaptan Tanımlama')),
      body: FaceDetectionScreen(
        onCaptainIdentified: (bool success) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(success ? 'Başarılı' : 'Uyarı'),
              content: Text(success
                  ? 'Sistem çalışmaya hazır.'
                  : 'Tanımlı kaptan bulunamadı. Lütfen kayıt olunuz.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('Tamam'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
