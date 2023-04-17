// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:drift_cars/ui/screens/add_car_screen.dart' as _i2;
import 'package:drift_cars/ui/screens/db_viewer_screen.dart' as _i1;
import 'package:drift_cars/ui/screens/home_screen.dart' as _i3;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    DBViewerRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DBViewerScreen(),
      );
    },
    AddCarRoute.name: (routeData) {
      final args = routeData.argsAs<AddCarRouteArgs>(
          orElse: () => const AddCarRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddCarScreen(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DBViewerScreen]
class DBViewerRoute extends _i4.PageRouteInfo<void> {
  const DBViewerRoute({List<_i4.PageRouteInfo>? children})
      : super(
          DBViewerRoute.name,
          initialChildren: children,
        );

  static const String name = 'DBViewerRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddCarScreen]
class AddCarRoute extends _i4.PageRouteInfo<AddCarRouteArgs> {
  AddCarRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          AddCarRoute.name,
          args: AddCarRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddCarRoute';

  static const _i4.PageInfo<AddCarRouteArgs> page =
      _i4.PageInfo<AddCarRouteArgs>(name);
}

class AddCarRouteArgs {
  const AddCarRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'AddCarRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
