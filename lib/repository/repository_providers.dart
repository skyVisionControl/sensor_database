import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';
import '../model/sensor_data.dart';

/// ------------ Canlı sensör akışı ------------
final sensorStreamProvider = StreamProvider.autoDispose<SensorData>((ref) {
  final db = FirebaseDatabase.instance.ref('sensors');
  return db.onValue.map((e) {
    final raw = e.snapshot.value;
    if (raw == null) return SensorData.empty;
    return SensorData.fromMap(Map<dynamic, dynamic>.from(raw as Map));
  });
});

/// ------------ Son 30 sıcaklık değeri ------------
final historyProvider =
    StateNotifierProvider.autoDispose<_HistoryNotifier, List<double>>((ref) {
  return _HistoryNotifier(ref.watch(sensorStreamProvider.stream));
});

class _HistoryNotifier extends StateNotifier<List<double>> {
  _HistoryNotifier(Stream<SensorData> stream) : super([]) {
    stream.listen((d) {
      final list = [...state, d.temperature];
      if (list.length > 30) list.removeAt(0);
      state = list;
    });
  }
}
