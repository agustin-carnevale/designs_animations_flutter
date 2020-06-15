import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  double porcentaje = 10.0;
  double nuevoPorcentaje = 0.0;

  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener(() {
      // print('Valor Controller: ${controller.value}');
      setState(() {
         porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value);
      });
     
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
         setState(() {
           porcentaje = nuevoPorcentaje;
           nuevoPorcentaje += 10;
           if(nuevoPorcentaje >100){
             nuevoPorcentaje =0;
           }
         });
         controller.forward(from: 0.0);
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          height: 300,
          width: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje),
          ),
        ),
      ),
    );
  }
}



class _MiRadialProgress extends CustomPainter {
   _MiRadialProgress(this.porcentaje);
  final porcentaje;

  @override
  void paint(Canvas canvas, Size size) {

    //Circulo Completo
    final paint = Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

    final Offset center = Offset(size.width*0.5, size.height*0.5);
    final double radio = min(size.width*0.5, size.height*0.5);
    canvas.drawCircle(center, radio, paint);

    //Arco
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color       = Colors.pink
      ..style       = PaintingStyle.stroke;

    //Parte llena
    double arcAngle = 2* pi * (porcentaje/100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio), 
      -pi/2, 
      arcAngle, 
      false, 
      paintArco);
    
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}