// import 'package:disenos_course/src/pages/animaciones_page.dart';
// import 'package:disenos_course/src/pages/graficas_circulares_page.dart';
// import 'package:disenos_course/src/pages/headers_page.dart';
// import 'package:disenos_course/src/pages/slideshow_page.dart';
// import 'package:disenos_course/src/retos/cuadrado_animado_page.dart';
// import 'package:disenos_course/src/pages/pinterest_page.dart';
import 'package:disenos_course/src/pages/emergency_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños App',
      debugShowCheckedModeBanner: false,
      home: EmergencyPage(),
    );
  }
}
