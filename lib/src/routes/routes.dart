import 'package:disenos_course/src/pages/animaciones_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos_course/src/pages/slideshow_page.dart';
import 'package:disenos_course/src/pages/emergency_page.dart';
import 'package:disenos_course/src/pages/headers_page.dart';
import 'package:disenos_course/src/retos/cuadrado_animado_page.dart';
import 'package:disenos_course/src/pages/graficas_circulares_page.dart';
import 'package:disenos_course/src/pages/sliver_list_page.dart';
import 'package:disenos_course/src/pages/pinterest_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, "SlideShow", SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, "Emergency", EmergencyPage()),
  _Route(FontAwesomeIcons.heading, "Headers", HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, "Animated Square", AnimacionesPage()),
  _Route(FontAwesomeIcons.circleNotch, "Progress Circular Bar", GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, "Pinterest", PinterestPage()),
  _Route(FontAwesomeIcons.mobile, "Slivers", SliverListPage()),
];

class _Route{
  _Route(this.icon, this.title, this.page);
  final IconData icon;
  final String title;
  final Widget page;
}