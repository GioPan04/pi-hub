// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    PlayerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlayerPage(),
      );
    },
    ScreensaverRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreensaverPage(),
      );
    },
  };
}

/// generated route for
/// [PlayerPage]
class PlayerRoute extends PageRouteInfo<void> {
  const PlayerRoute({List<PageRouteInfo>? children})
      : super(
          PlayerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlayerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreensaverPage]
class ScreensaverRoute extends PageRouteInfo<void> {
  const ScreensaverRoute({List<PageRouteInfo>? children})
      : super(
          ScreensaverRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScreensaverRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
