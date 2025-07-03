class RouteNames {
  static const home = '/';
  static const flightData = '/flight-data';
  static const flightDetails = '/flight-details';
  static const balloonDetail = '/balloon-detail';
  static const captainInfo = '/captain-info';
  static const location = '/location';
  static const violationDetail = '/violation-detail';

  // Parametreli rotalar
  static String flightDetailsWithId(String id) => '/flight-details/$id';
  static String balloonDetailWithId(String id) => '/balloon-detail/$id';
  static String violationDetailWithId(String id) => '/violation-detail/$id';
}