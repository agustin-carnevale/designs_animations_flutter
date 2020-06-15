import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  const RadialProgress({Key key, @required this.porcentaje, this.color=Colors.blue, this.colorSecundario = Colors.grey, this.grosor=10.0, this.grosorSecundario=4.0}) : super(key: key);
  final double porcentaje;
  final Color color;
  final Color colorSecundario;
  final double grosor;
  final double grosorSecundario;

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  AnimationController controller;
  double porcentajeAnterior;
  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller, 
      // child: ,
      builder: (BuildContext context, Widget child){
      return Container(
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _MiRadialProgress((widget.porcentaje-diferenciaAnimar)+ (diferenciaAnimar * controller.value), widget.color, widget.colorSecundario, widget.grosor, widget.grosorSecundario)
        ,)
      );
    }
    );

  }
}

class _MiRadialProgress extends CustomPainter {
   _MiRadialProgress(this.porcentaje, this.color, this.colorSecundario, this.grosor, this.grosorSecundario);
  final porcentaje;
  final Color color;
  final Color colorSecundario;
  final double grosor;
  final double grosorSecundario;

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: Offset(0, 0),
      radius: 180,
    );

    final Gradient gradiente = new LinearGradient(
      colors: <Color>[
        Color(0xffC012FF),
        Color(0xff6D05E8),
        Colors.red,
      ]
    );

    //Circulo Completo
    final paint = Paint()
      ..strokeWidth = grosorSecundario
      ..color       = colorSecundario
      ..style       = PaintingStyle.stroke;

    final Offset center = Offset(size.width*0.5, size.height*0.5);
    final double radio = min(size.width*0.5, size.height*0.5);
    canvas.drawCircle(center, radio, paint);

    //Arco
    final paintArco = Paint()
      ..strokeWidth = grosor
      ..color       = color
      // ..shader        = gradiente.createShader(rect)
      ..strokeCap   = StrokeCap.round
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