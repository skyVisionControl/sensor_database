import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../view/screens/home_screen.dart';
import '../../view/screens/flight_data_screen.dart';
import '../../view/screens/flight_details_screen.dart';
import '../../view/screens/balloon_detail_screen.dart';
import '../../view/screens/captain_info_screen.dart';
import '../../view/screens/location_screen.dart';
import '../../view/screens/violation_detail_screen.dart';
import 'route_names.dart';

/// Uygulama genelinde kullanılacak GoRouter sağlayıcısı.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.home,
    routes: [
      // Ana ekran
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        builder: (_, __) => const HomeScreen(),
      ),

      // Uçuş Verileri
      GoRoute(
        path: RouteNames.flightData,
        name: RouteNames.flightData,
        builder: (_, __) => const FlightDataScreen(),
      ),

      // Uçuş Detay (şimdilik idsiz)
      GoRoute(
        path: RouteNames.flightDetails,
        name: RouteNames.flightDetails,
        builder: (_, __) => const FlightDetailsScreen(),
      ),

      // Balon Detay (parametresiz)
      GoRoute(
        path: RouteNames.balloonDetail,
        name: RouteNames.balloonDetail,
        builder: (_, __) => const BalloonDetailScreen(),
      ),

      // Pilot Bilgisi
      GoRoute(
        path: RouteNames.captainInfo,
        name: RouteNames.captainInfo,
        builder: (_, __) => const CaptainInfoScreen(),
      ),

      // Konum
      GoRoute(
        path: RouteNames.location,
        name: RouteNames.location,
        builder: (_, __) => const LocationScreen(),
      ),

      // İhlal Detay (şimdilik idsiz)
      GoRoute(
        path: RouteNames.violationDetail,
        name: RouteNames.violationDetail,
        builder: (_, __) => const ViolationDetailScreen(),
      ),
    ],
  );
});
