// lib/core/routing/app_router.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../view/screens/home_screen.dart';
import '../../view/screens/flight_data_screen.dart';
import '../../view/screens/flight_details_screen.dart';
import '../../view/screens/balloon_detail_screen.dart';
import '../../view/screens/captain_info_screen.dart';
import '../../view/screens/location_screen.dart';
import '../../view/screens/violation_detail_screen.dart';
import '../../view/screens/face_recognition_screen.dart';  
import '../../modules/mobile_face/view/face_detection_screen.dart'; 
import '../../modules/mobile_face/view/captain_identification_screen.dart'; // <-- yeni modül import

import 'route_names.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.home,
    routes: [
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteNames.faceRecognition,
        name: RouteNames.faceRecognition,
        builder: (_, __) => const FaceRecognitionScreen(),
      ),
      GoRoute(
        path: RouteNames.captainIdentification,
        name: RouteNames.captainIdentification,
        builder: (_, __) => const CaptainIdentificationScreen(),
      ),
      GoRoute(
        path: RouteNames.mobileFaceDetection, // yeni rota
        name: RouteNames.mobileFaceDetection,
        builder: (_, __) => const FaceDetectionScreen(),
      ),
      GoRoute(
        path: RouteNames.flightData,
        name: RouteNames.flightData,
        builder: (_, __) => const FlightDataScreen(),
      ),
      GoRoute(
        path: RouteNames.flightDetails,
        name: RouteNames.flightDetails,
        builder: (_, __) => const FlightDetailsScreen(),
      ),
      GoRoute(
        path: RouteNames.balloonDetail,
        name: RouteNames.balloonDetail,
        builder: (_, __) => const BalloonDetailScreen(),
      ),
      GoRoute(
        path: RouteNames.captainInfo,
        name: RouteNames.captainInfo,
        builder: (_, __) => const CaptainInfoScreen(),
      ),
      GoRoute(
        path: RouteNames.location,
        name: RouteNames.location,
        builder: (_, __) => const LocationScreen(),
      ),
      GoRoute(
        path: RouteNames.violationDetail,
        name: RouteNames.violationDetail,
        builder: (_, __) => const ViolationDetailScreen(),
      ),
    ],
  );
});
