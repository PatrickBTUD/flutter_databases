// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:realm_cars/ui/screens/add_car_screen.dart' as _i1;
import 'package:realm_cars/ui/screens/home_screen.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AddCarRoute.name: (routeData) {
      final args = routeData.argsAs<AddCarRouteArgs>(
          orElse: () => const AddCarRouteArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AddCarScreen(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCarScreen]
class AddCarRoute extends _i3.PageRouteInfo<AddCarRouteArgs> {
  AddCarRoute({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          AddCarRoute.name,
          args: AddCarRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddCarRoute';

  static const _i3.PageInfo<AddCarRouteArgs> page =
      _i3.PageInfo<AddCarRouteArgs>(name);
}

class AddCarRouteArgs {
  const AddCarRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'AddCarRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
