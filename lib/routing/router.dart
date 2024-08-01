import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shaqyru_app/presentation/post_page.dart';
import 'package:shaqyru_app/presentation/shakyru_page.dart';
import 'package:shaqyru_app/routing/route_names.dart';
import 'package:shaqyru_app/extantions/getRoutingParams.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PostRoute:
      return _getPageRoute(const PostPage(), settings);
    default:
      try {
        final params = settings.name?.getRoutingData;
        return _getPageRoute(
          ShakyruBuilder(
            guestName: params?.queryParameters['id'] as String? ?? '0LTQvtGB0YLQsNGA',
            guestId: params?.queryParameters['id'] as String? ?? '0LTQvtGB0YLQsNGA',
          ),
          settings,
        );
      } catch(e) {
        print(e);
        return _getPageRoute(
          const ShakyruBuilder(
            guestName: 'Қонақ',
            guestId: '0',
          ),
          settings,
        );
      }
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String? routeName;

  _FadeRoute({
    required this.child,
    this.routeName = HomeRoute,
  }) : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}

Map<String, WidgetBuilder> routes = {
  '/': (context) => const ShakyruBuilder(
        guestName: 'достар',
        guestId: '0',
      ),
  '/post': (context) => const PostPage(),
  '/shakyru': (context) => const ShakyruBuilder(
    guestName: 'достар',
    guestId: '0',
  ),
};
