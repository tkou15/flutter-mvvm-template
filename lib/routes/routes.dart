import 'package:flapp/routes/route_path.dart';
import 'package:flapp/ui/home/home_page.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter/material.dart';

final routes = RouteMap(
  routes: {RoutePath.root: (_) => const MaterialPage(child: HomePage())},
);
