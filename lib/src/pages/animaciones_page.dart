import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CuadradoAnimado() ,)
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key key,
  }) : super(key: key);

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 4000 ));
    
    rotacion = Tween(begin: 0.0, end: 2.0* Math.pi ,).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    opacidad = Tween( begin: 0.1, end: 1.0,).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut))
    );

    opacidadOut = Tween( begin: 1.0, end: 0.0,).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeOut))
    );

    moverDerecha = Tween(begin:0.0 ,end: 200.0 ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOutBack)
    );

    agrandar = Tween(begin:0.0 ,end: 2.0 ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOutBack)
    );


    controller.addListener(() {
    // print('Status: ${controller.status}');
    if(controller.status == AnimationStatus.completed){
      controller.reverse();
      // controller.reset();
       // controller.repeat();
    }

    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {

    //Reproducir / Play
    controller.forward();
    // controller.repeat();


    return AnimatedBuilder(
      animation: controller, 
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child){
        // print(rotacion.value);
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidadOut.value,
              child: Opacity(
                child: Transform.scale(
                  scale: agrandar.value,
                  child: child),
                opacity: opacidad.value,
              ),
            )
          ),
        );
      }
      );
  }
}



class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}