import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'controller.dart';
import 'api_constants/routes.dart';

class Api {
  final Controller _controller = Controller();
  Handler get handler {
    Router router = Router();

    router.get(
      ServerRoutes.vinyl,
      _controller.getVinyl,
    );

    router.get(
      ServerRoutes.user,
      _controller.getUser,
    );

    router.post(
      ServerRoutes.user,
      _controller.addUser,
    );

    router.delete(
      ServerRoutes.user,
      _controller.deleteUser,
    );

    return router;
  }
}
