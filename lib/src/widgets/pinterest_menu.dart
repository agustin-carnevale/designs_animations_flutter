import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenu extends StatelessWidget {
  PinterestMenu({Key key, 
  @required this.items,
  this.show=true, 
  this.backgroundColor = Colors.white, 
  this.activeColor = Colors.black, 
  this.inactiveColor = Colors.blueGrey,
  }) : super(key: key);

  final List<PinterestButton> items;
  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> _MenuModel(),
      child: Builder( builder: (BuildContext context){
        final model = Provider.of<_MenuModel>(context);
        model.backgroundColor = backgroundColor;
        model.activeColor =activeColor;
        model.inactiveColor=inactiveColor;
        return AnimatedOpacity(
          duration: Duration(milliseconds:250),
          opacity: (show) ? 1:0,
          child: _PinterestMenuBackground(
            child:_MenuItems(menuItems: items),
          ),
        );
      }),
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
    final model = Provider.of<_MenuModel>(context);
    return Container(
      child: child,
        width: 250,
        height: 60,
        decoration: BoxDecoration(
          color: model.backgroundColor,
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
    final model = Provider.of<_MenuModel>(context);
    return GestureDetector(
      onTap: (){
        model.selectedItem = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child:  Icon(
          item.icon,
          size: (model.selectedItem == index) ? 34 : 25,
          color: (model.selectedItem == index) ? model.activeColor : model.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{
  Color _backgroundColor;
  Color _activeColor;
  Color _inactiveColor;
  int _selectedItem=0;


  int get selectedItem=> this._selectedItem;
  set selectedItem(int index){
    this._selectedItem=index;
    notifyListeners();
  }

  Color get backgroundColor=> this._backgroundColor;
  set backgroundColor(Color color){
    this._backgroundColor=color;
  }
  Color get activeColor=> this._activeColor;
  set activeColor(Color color){
    this._activeColor=color;
  }
  Color get inactiveColor=> this._inactiveColor;
  set inactiveColor(Color color){
    this._inactiveColor=color;
  }
}