import 'package:disenos_course/src/models/layout_model.dart';
import 'package:disenos_course/src/pages/slideshow_page.dart';
import 'package:disenos_course/src/routes/routes.dart';
import 'package:disenos_course/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class LauncherTabletPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Diseños en Flutter - Tablet")
      ),
      drawer: _MenuPrincipal(),
      body: Row(
        children: <Widget>[
          Container(
          width: 300,
          height: double.infinity,
          child: _ListaOpciones(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: appTheme.darkTheme ? Colors.grey: appTheme.currentTheme.accentColor,
          ),
          Expanded(child: layoutModel.currentPage)
        ]
      ),
      // body: _ListaOpciones(),
   );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context,i) =>Divider(
        color: appTheme.primaryColorLight,
      ), 
      itemCount: pageRoutes.length,
      itemBuilder: ( context,i)=> ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor),
        title: Text(pageRoutes[i].title),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> pageRoutes[i].page));
          final layoutModel = Provider.of<LayoutModel>(context, listen: false);
          layoutModel.currentPage =pageRoutes[i].page;
        },
      ), 
    );
  }
}

class  _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Drawer(
          child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentTheme.accentColor,
                  child: Text('AC', style: TextStyle(fontSize:50),),
                ),
              ),
            ),
            Expanded(child: _ListaOpciones(),),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color:appTheme.currentTheme.accentColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                activeColor: appTheme.currentTheme.accentColor,
                value: appTheme.darkTheme, 
                onChanged: (value){
                  appTheme.darkTheme=value;
                }
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color:appTheme.currentTheme.accentColor),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  activeColor: appTheme.currentTheme.accentColor,
                  value: appTheme.customTheme, 
                  onChanged: (value){
                    appTheme.customTheme=value;
                  }
                ),
              ),
            ),
          ]
        )
      ),
    );
  }
}