import 'package:firebase_database/firebase_database.dart';
import '../model/sensor_data.dart';

class FirebaseRepository {
  final DatabaseReference _ref = FirebaseDatabase.instance.ref('sensors');

  Stream<SensorData> watchSensors() => _ref.onValue.map((event) {
        final map = event.snapshot.value as Map<dynamic, dynamic>;
        return SensorData.fromMap(map);
      });
}
