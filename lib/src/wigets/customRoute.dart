import 'package:flutter/material.dart';


class CustomRoute<T> extends MaterialPageRoute<T> {
  CustomRoute(
      {WidgetBuilder builder,
      RouteSettings settings,
      initialRouteName = "customRouter",})
      : super(builder: builder, settings: settings);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == "customRouter") {
      return child;
    }
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
