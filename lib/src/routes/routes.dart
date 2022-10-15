import 'package:components/src/pages/list_view_page.dart';
import 'package:flutter/material.dart';

// import 'package:components/src/pages/home_temp.dart';
import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/card_page.dart';
import 'package:components/src/pages/animated_container_page.dart';
import 'package:components/src/pages/inputs_page.dart';
import 'package:components/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/'                     : (BuildContext context) => HomePage(),
    'alert'                 : (BuildContext context) => AlertPage(),
    'avatar'                : (BuildContext context) => AvatarPage(),
    'card'                  : (BuildContext context) => CardPage(),
    'animated_container'    : (BuildContext context) => AnimatedContainerPage(),
    'inputs'                : (BuildContext context) => InputPage(),
    'sliders'               : (BuildContext context) => SliderPage(),
    'list_view'             : (BuildContext context) => ListViewPage(),
  };
}