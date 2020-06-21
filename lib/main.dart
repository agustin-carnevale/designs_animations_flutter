import 'package:disenos_course/src/models/layout_model.dart';
import 'package:disenos_course/src/pages/launcher_page.dart';
import 'package:disenos_course/src/pages/launcher_tablet_page.dart';
import 'package:disenos_course/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
        create: (BuildContext context) => ThemeChanger(2)),
        ChangeNotifierProvider<LayoutModel>(create: (BuildContext context) => LayoutModel(),),
      ],
      child: MyApp(),
    ),
  );
}

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (BuildContext context) => ThemeChanger(2),
//       child: MyApp()
//     )
//   );
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      title: 'Diseños App',
      debugShowCheckedModeBanner: false,
      home: OrientationBuilder
      (builder: (BuildContext context, Orientation orientation) { 
        final screenSize = MediaQuery.of(context).size;

        if(screenSize.width >500){
          return LauncherTabletPage();
        }else{
          return LauncherPage();
        }
       },),
    );
  }
}
