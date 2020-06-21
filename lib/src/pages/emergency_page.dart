import 'package:animate_do/animate_do.dart';
import 'package:disenos_course/src/widgets/headers.dart';
import 'package:disenos_course/src/widgets/nice_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if(MediaQuery.of(context).size.height>400){
      isLarge=true;
    }else{
      isLarge=false;
    }

    final items = <ItemBoton>[
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

    List <Widget> buttons = items.map((item) => 
      FadeInLeft(
        duration: Duration(milliseconds:250),
        child: NiceButton(icon: item.icon , text: item.texto, color1: item.color1, color2: item.color2 ,onPressed: (){},))
    ).toList();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _ButtonsList(buttons: buttons),
          if(isLarge) _Header(),
        ],
      )
   );
  }
}

class _ButtonsList extends StatelessWidget {
  const _ButtonsList({
    Key key,
    @required this.buttons,
  }) : super(key: key);

  final List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if(MediaQuery.of(context).size.height>400){
      isLarge=true;
    }else{
      isLarge=false;
    }
    return SafeArea(
          child: Container(
        margin: EdgeInsets.only(top: (isLarge)?  220: 10),
        child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          if(isLarge) SizedBox(height:60),
          ...buttons,
        ],),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconHeader(
         icon: FontAwesomeIcons.plus,
         title: "Asistencia Médica",
         subtitle: "Has solicitado",
         color1: Color(0xff526BF6),
         color2:Color(0xff67ACF2),
        ),
        Positioned(
          right: 0,
          top: 50,
          child: RawMaterialButton(
            onPressed: (){},
            shape: CircleBorder(),
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,)) ,
        ),
      ],
    );
  }
}

class NiceButtonTemp extends StatelessWidget {
  const NiceButtonTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NiceButton(
      icon: FontAwesomeIcons.carCrash,
      text: "Motor Accident",
      color1:Color(0xff6989F5),
      color2: Color(0xff906EF5),
      onPressed: (){
        print("Button pressed!!");
      },
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      title: "Asistencia Médica",
      subtitle: "Has solicitado",
      color1: Color(0xff526BF6),
      color2:Color(0xff67ACF2),
    );
  }
}

