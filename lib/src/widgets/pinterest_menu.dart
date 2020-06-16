import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(icon: Icons.pie_chart, onPressed: (){print('Icon Pie_chart');}),
    PinterestButton(icon: Icons.search, onPressed: (){print('Icon Search');} ),
    PinterestButton(icon: Icons.notifications, onPressed: (){print('Icon Notificatinos');} ),
    PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('Icon supervised_user_circle');} ),

  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider(
        create: (_)=> _MenuModel(),
        child: _PinterestMenuBackground(child:_MenuItems(menuItems: items),)),
    );
  }
}

class PinterestButton{
  PinterestButton({@required this.onPressed, @required this.icon});
  final Function onPressed;
  final IconData icon;
}


class _PinterestMenuBackground extends StatelessWidget {
  const _PinterestMenuBackground({ @required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
        width: 250,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(
            color: Colors.black38,
            offset: Offset(5,5),
            blurRadius: 10,
            spreadRadius: -5,
            ),
          ]
        ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({Key key, this.menuItems}) : super(key: key);
  final List<PinterestButton> menuItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _PinterestMenuButton(index:i,item:menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton({Key key, this.index, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        child:  Icon(
          item.icon,
          size: 25,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{
  int _selectedItem=0;
  int get selectedItem=> this._selectedItem;

  set selectedItem(int index){
    this._selectedItem=index;
    notifyListeners();
  }
}