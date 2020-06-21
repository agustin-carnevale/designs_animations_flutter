import 'package:disenos_course/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _ListaTareas(),
      //body: _ListaTareas(),
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(
            bottom: -5,
            right: 0,
            child: _NewListButton()),
        ],
      ),
   );
  }
}

class _NewListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);
    return ButtonTheme(
      height: 100,
      minWidth: size.width*0.9,
      child: RaisedButton(
        color: (appTheme.darkTheme) ? appTheme.currentTheme.accentColor : Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
        ),
        child: Text(
          "Create New List",
          style: TextStyle(
          color:  (appTheme.darkTheme) ? appTheme.currentTheme.scaffoldBackgroundColor :Colors.white, 
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 3
        ),
        ),
        onPressed: (){},
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return CustomScrollView(
      slivers: <Widget>[
        // SliverAppBar(
        //   elevation: 0,
        //   floating: true,
        //   backgroundColor: Colors.red,
        //   title: Text("Hola Mundo"),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color:  (appTheme.darkTheme) ? appTheme.currentTheme.scaffoldBackgroundColor : Colors.white,
              child: _Titulo()),
          ),
        ),
        SliverList(
              delegate: SliverChildListDelegate([
                ...items,
                SizedBox(height: 120),
              ]),
            ),
          ]
        );
  }
}
          
  class _SliverCustomHeaderDelegate  extends SliverPersistentHeaderDelegate{
    _SliverCustomHeaderDelegate({@required this.minHeight, @required this.maxHeight, @required this.child});
    final double minHeight;
    final double maxHeight;
    final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;

  @override
  double get minExtent => (minHeight < maxHeight) ? minHeight : maxHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent || 
            minHeight != oldDelegate.minExtent ||
            child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical:10),
          child: Text(
            "New", 
            style: TextStyle(
              color: (appTheme.darkTheme) ? Colors.grey : Color(0xff532128), 
              fontSize: 50))
        ),
        Stack(
          children: <Widget>[
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xffF7CDD5),
              ),
            ),
            Container(
               child: Text("List", style: TextStyle(
                 color:(appTheme.darkTheme) ? Colors.blueGrey : Color(0xffD93A30), 
                 fontSize: 50, fontWeight: FontWeight.bold))
            ),
          ],
        ),
      ],
    );
  }
}



class _ListaTareas extends StatelessWidget {

  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem(this.titulo, this.color);
  final String titulo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      child: Text(titulo, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold ),),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.blueGrey : color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}