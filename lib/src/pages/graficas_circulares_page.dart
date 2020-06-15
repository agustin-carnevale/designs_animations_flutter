import 'package:disenos_course/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100){
              porcentaje = 0;
            }
          });
        }
      ),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, 
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.lime,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.pink,),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, 
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.yellow,),
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.indigo,),
            ]
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    Key key,
    @required this.porcentaje, @required this.color,
  }) : super(key: key);
  final Color color;

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      // color: Colors.indigo,
      child: RadialProgress(
        porcentaje: porcentaje, 
        color: color, 
        colorSecundario: Colors.grey,
        grosor: 15.0,
        grosorSecundario: 7.0,
      ),
    );
  }
}