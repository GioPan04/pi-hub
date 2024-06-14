import 'package:auto_route/auto_route.dart';
import 'pages/screensaver.dart';
import 'pages/player.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: ScreensaverRoute.page,
      ),
      AutoRoute(
        page: PlayerRoute.page,
        initial: true,
      ),
    ];
  }
}
