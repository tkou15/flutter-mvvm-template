import 'package:flapp/routes/route_path.dart';
import 'package:flapp/ui/xxx/xxx_page.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter/material.dart';

final routes = RouteMap(
  routes: {RoutePath.root: (_) => const MaterialPage(child: XXXPage())},
);
