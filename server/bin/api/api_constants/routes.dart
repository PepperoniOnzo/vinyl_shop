import 'routes_id.dart';

class ServerRoutes {
  static const String vinyl = '/vinyl/<${RoutesId.vinylId}>';

  static const String user = '/user';
  static const String userGet = '/user/<${RoutesId.userId}>';
  static const String userDelete = '/user/<${RoutesId.userId}>';
}
