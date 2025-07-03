import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_vision_control/view/screens/balloon_detail_screen.dart';
import 'package:sky_vision_control/view/screens/captain_info_screen.dart';
import 'package:sky_vision_control/view/screens/flight_details_screen.dart';
import 'package:sky_vision_control/view/screens/location_screen.dart';
import 'package:sky_vision_control/view/screens/violation_detail_screen.dart';
import 'route_names.dart';
import '../../view/screens/home_screen.dart';
import '../../view/screens/flight_data_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.home,
    routes: [
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        pageBuilder: (context, state) => MaterialPage(
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: RouteNames.flightData,
        name: RouteNames.flightData,
        pageBuilder: (context, state) => MaterialPage(
          child: FlightDataScreen(),
        ),
      ),
      GoRoute(
        path: '${RouteNames.flightDetails}/:id',
        name: RouteNames.flightDetails,
        pageBuilder: (context, state) => MaterialPage(
          child: FlightDetailsScreen(),
        ),
      ),
      GoRoute(
        path: '${RouteNames.balloonDetail}/:id',
        name: RouteNames.balloonDetail,
        pageBuilder: (context, state) => MaterialPage(
          child: BalloonDetailScreen(),
        ),
      ),
      GoRoute(
        path: RouteNames.captainInfo,
        name: RouteNames.captainInfo,
        pageBuilder: (context, state) => MaterialPage(
          child: CaptainInfoScreen(),
        ),
      ),
      GoRoute(
        path: RouteNames.location,
        name: RouteNames.location,
        pageBuilder: (context, state) => MaterialPage(
          child: LocationScreen(),
        ),
      ),
      GoRoute(
        path: '${RouteNames.violationDetail}/:id',
        name: RouteNames.violationDetail,
        pageBuilder: (context, state) => MaterialPage(
          child: ViolationDetailScreen(),
        ),
      ),
    ],
  );
});