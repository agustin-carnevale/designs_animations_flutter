import 'package:disenos_course/src/theme/theme.dart';
import 'package:disenos_course/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return Scaffold(
      body:  HeaderWave(color: appTheme.accentColor,),
    );
  }
}