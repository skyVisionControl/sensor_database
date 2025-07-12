/// Firebase'teki /sensors düğümünü temsil eden model
class SensorData {
  final double temperature;
  final double pressure;
  final double roll;
  final double pitch;
  final double yaw;

  final double? lat;
  final double? lng;
  final double? altitude;
  final double? speed;

  const SensorData({
    required this.temperature,
    required this.pressure,
    required this.roll,
    required this.pitch,
    required this.yaw,
    this.lat,
    this.lng,
    this.altitude,
    this.speed,
  });

  factory SensorData.fromMap(Map<dynamic, dynamic> m) => SensorData(
        temperature: (m['temperature'] ?? 0).toDouble(),
        pressure: (m['pressure'] ?? 0).toDouble(),
        roll: (m['roll'] ?? 0).toDouble(),
        pitch: (m['pitch'] ?? 0).toDouble(),
        yaw: (m['yaw'] ?? 0).toDouble(),
        lat: (m['gps']?['lat'])?.toDouble(),
        lng: (m['gps']?['lng'])?.toDouble(),
        altitude: (m['gps']?['alt'])?.toDouble(),
        speed: (m['gps']?['speed'])?.toDouble(),
      );

  /// Boş (fallback) veri – null snapshot durumunda kullanılır
  static const empty = SensorData(
    temperature: 0,
    pressure: 0,
    roll: 0,
    pitch: 0,
    yaw: 0,
  );
}
