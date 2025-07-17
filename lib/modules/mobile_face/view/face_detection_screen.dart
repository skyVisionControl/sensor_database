// lib/modules/mobile_face/view/face_detection_screen.dart

import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

import 'package:sky_vision_control/modules/mobile_face/helper/cordinates_translator.dart';
import 'package:sky_vision_control/modules/mobile_face/helper/face_painter.dart';
import 'package:sky_vision_control/modules/mobile_face/helper/face_recognition.dart';
import 'package:sky_vision_control/modules/mobile_face/model/face_registry.dart';
import 'package:sky_vision_control/modules/mobile_face/view/face_registry_dialog.dart';

class FaceDetectionScreen extends StatefulWidget {
  const FaceDetectionScreen({
    super.key,
    this.onCaptainIdentified,
  });

  /// Yüz tanıma tamamlandığında sonucu döndürür (true = kaptan bulundu)
  final void Function(bool isIdentified)? onCaptainIdentified;

  @override
  State<FaceDetectionScreen> createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  final imagePicker = ImagePicker();
  final faceRecognition = FaceRecognition();
  final faceDetector =
      FaceDetector(options: FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate));

  img.Image? _viewImage;
  Size? _imageActualSize;
  bool isProcessing = false;
  int resizeImageWidth = 400;

  /// Her tespit edilen yüz için FaceMatch bilgisi
  List<FaceMatch> recognizedFaces = [];

  @override
  void initState() {
    super.initState();
    faceRecognition.loadModel();
  }

  @override
  void dispose() {
    faceRecognition.close();
    faceDetector.close();
    super.dispose();
  }

  /// Kameradan veya galeriden resim seç ve işle
  Future<void> pickAndProcess({ImageSource source = ImageSource.camera}) async {
    setState(() {
      isProcessing = true;
      _viewImage = null;
      _imageActualSize = null;
      recognizedFaces.clear();
    });

    final picked = await imagePicker.pickImage(source: source);
    if (picked == null) {
      setState(() => isProcessing = false);
      return;
    }

    final file = File(picked.path);
    final inputImage = InputImage.fromFile(file);
    final faces = await faceDetector.processImage(inputImage);
    final original = await img.decodeImageFile(picked.path);

    if (original == null) {
      setState(() => isProcessing = false);
      return;
    }

    // Her yüz için embedding oluştur ve kayıtlılarla karşılaştır
    for (final face in faces) {
      final embedding = await faceRecognition.recognizeFace(original, face);
      final match = FaceRegistry.findFromList(embedding, face.boundingBox);
      if (match != null) recognizedFaces.add(match);
    }

    // Ekranda gösterilecek boyutları hesapla
    final resizedHeight = (original.height / original.width) * resizeImageWidth;
    final resized = img.copyResize(original,
        width: resizeImageWidth, height: resizedHeight.toInt());

    setState(() {
      _viewImage = resized;
      _imageActualSize = Size(original.width.toDouble(), original.height.toDouble());
      isProcessing = false;
    });

    // Kaptan tanımlı mı kontrol et ve callback ile bildir
    final bool captainFound =
        recognizedFaces.any((faceData) => faceData.isRecognized);
    widget.onCaptainIdentified?.call(captainFound);
  }

  /// Dart img.Image → ui.Image çevirir
  Future<ui.Image?> loadUiImage(img.Image? image) async {
    if (image == null) return null;
    final completer = Completer<ui.Image>();
    ui.decodeImageFromList(img.JpegEncoder().encode(image), completer.complete);
    return completer.future;
  }

  /// Bilinmeyen yüzü kayıt etmek için çağırılır
  Future<void> registerFace() async {
    final unknown = recognizedFaces.firstWhere((f) => !f.isRecognized);
    final box = unknown.boundingRect;
    final viewSize = Size(_viewImage!.width.toDouble(), _viewImage!.height.toDouble());
    final left = translateX(box.left, viewSize, _imageActualSize!).toInt();
    final top = translateY(box.top, viewSize, _imageActualSize!).toInt();
    final right = translateX(box.right, viewSize, _imageActualSize!).toInt();
    final bottom = translateY(box.bottom, viewSize, _imageActualSize!).toInt();

    final cropped = img.copyCrop(_viewImage!, x: left, y: top, width: right - left, height: bottom - top);
    await RegisterFaceDialog(
      context: context,
      imageBytes: img.JpegEncoder().encode(cropped),
      person: unknown.user,
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Face recognition app (POC)"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: DefaultTextStyle(
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                FutureBuilder<ui.Image?>(
                  future: loadUiImage(_viewImage),
                  builder: (ctx, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return isProcessing
                          ? const CircularProgressIndicator()
                          : const Text("Please select image");
                    }
                    final uiImage = snap.data;
                    if (uiImage == null) {
                      return const SizedBox();
                    }
                    return Column(
                      children: [
                        if (recognizedFaces.isNotEmpty)
                          CustomPaint(
                            painter: FaceDetectorPainter(
                              recognizedFaces,
                              _imageActualSize!,
                              uiImage,
                            ),
                            child: SizedBox(
                              width: _viewImage!.width.toDouble(),
                              height: _viewImage!.height.toDouble(),
                            ),
                          ),
                        const SizedBox(height: 10),
                        Text(recognizedFaces.isEmpty
                            ? "No faces found in picture"
                            : "Faces found: ${recognizedFaces.length}"),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => pickAndProcess(source: ImageSource.camera),
                  child: const Text("Use Camera"),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => pickAndProcess(source: ImageSource.gallery),
                  child: const Text("Use Gallery"),
                ),
                if (recognizedFaces.any((f) => !f.isRecognized)) ...[
                  const SizedBox(height: 30),
                  const Text("Unknown face detected. Save it?"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: registerFace,
                    child: const Text("SAVE"),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
