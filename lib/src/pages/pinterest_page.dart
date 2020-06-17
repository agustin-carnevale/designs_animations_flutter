import 'package:disenos_course/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> _MenuModel(),
      child: Scaffold(
        body: Stack(children: <Widget>[
          PinterestGrid(),
          _Menu(),
        ],)
        // body: PinterestGrid(),
        // body: PinterestMenu(),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).show;
    return Positioned(
      bottom: 40,
      child: Container(
        // color: Colors.red,
        width: widthScreen,
        child: Align(
          child:PinterestMenu(
            show:show,
            backgroundColor: Colors.white,
            activeColor: Colors.purple,
            inactiveColor: Colors.blueGrey,
             items: [
              PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Icon Pie_chart');}),
              PinterestButton(icon: Icons.search, onPressed: (){print('Icon Search');} ),
              PinterestButton(icon: Icons.notifications, onPressed: (){print('Icon Notificatinos');} ),
              PinterestButton(icon: Icons.verified_user, onPressed: (){print('Icon supervised_user_circle');} ),
            ],
          ) ,
        ),
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();
  double previousScrollOffset = 0.0;

  @override
  void initState() { 
    super.initState();
    controller.addListener(() {
      //print('ListenerScroll: ${controller.offset}');
      final model = Provider.of<_MenuModel>(context,listen: false);

      if(controller.offset > 150.0 && controller.offset > previousScrollOffset ){
        //print("ocultar Menu");
        model.show = false;
      }else{
        // print("Mostrar Menu");
        model.show = true;
      }
      previousScrollOffset = controller.offset;
    });
  }

 @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => PinterestItem(index: index),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class PinterestItem extends StatelessWidget {
  const PinterestItem({
    Key key, this.index,
  }) : super(key: key);
  final index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color:Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
        ));
  }
}


class _MenuModel with ChangeNotifier{
  bool _show = true;

  bool get show => this._show;

  set show(bool show){
    this._show=show;
    notifyListeners();
  }
}