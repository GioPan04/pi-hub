import 'package:auto_route/auto_route.dart';
import 'pages/screensaver.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: ScreensaverRoute.page,
          initial: true,
        ),
      ];
}
