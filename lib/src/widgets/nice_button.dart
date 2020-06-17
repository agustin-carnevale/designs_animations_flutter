import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NiceButton extends StatelessWidget {
NiceButton({
  this.icon = FontAwesomeIcons.carCrash, 
  @required this.text, 
  this.color1 = Colors.indigo, 
  this.color2 = Colors.lightBlue, 
  @required this.onPressed});

final IconData icon;
final String text;
final Color color1;
final Color color2;
final Function onPressed;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: <Widget>[
          _NiceButtonBackground(color1: this.color1, color2: this.color2, icon: this.icon),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            SizedBox(height: 140, width: 40,),
            FaIcon(this.icon, color: Colors.white, size: 40,),
            SizedBox(width: 20,),
            Expanded(child: Text(this.text, style: TextStyle(color: Colors.white, fontSize: 18),)),
            FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white, size: 30,),
            SizedBox(width: 40,),
          ] ,),
        ],
      ),
    );
  }
}

class _NiceButtonBackground extends StatelessWidget {
  const _NiceButtonBackground({
    Key key, this.color1, this.color2, this.icon,
  }) : super(key: key);

  final IconData icon;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(this.icon,size: 150,color: Colors.white.withOpacity(0.2),))
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(4, 6), blurRadius: 10 ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            this.color1,
            this.color2,
        ])
      ),
    );
  }
}