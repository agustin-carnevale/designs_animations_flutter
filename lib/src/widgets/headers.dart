import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
        color: Color(0xff615AAB),
      ),
    );
  }
}

// class HeaderDiagonal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Transform.rotate(
//       angle: -0.09,
//           child: Container(
//         height: 300,
//         color: Color(0xff615AAB),
//       ),
//     );
//   }
// }

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderDiagonalPainter(),
        ),
      );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .stroke .fill
    paint.strokeWidth = 2;

    final path = Path();

    //Dibujar con el path y el paint
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width,size.height * 0.30 );
    path.lineTo(size.width,0 );
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderTriangularPainter(),
        ),
      );
  }
}

class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .stroke .fill
    paint.strokeWidth = 2;
    final path = Path();

    //Dibujar con el path y el paint
    path.lineTo(size.width, size.height);
    path.lineTo(size.width,0 );
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {return true;}
}

class _HeaderTriangularInversoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .stroke .fill
    paint.strokeWidth = 2;
    final path = Path();

    //Dibujar con el path y el paint
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {return true;}
}



class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderPicoPainter(),
        ),
      );
  }
}

class _HeaderPicoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .stroke .fill
    paint.strokeWidth = 2;
    final path = Path();

    //Dibujar con el path y el paint
    path.lineTo(0, size.height* 0.25);
    path.lineTo(size.width*0.5, size.height* 0.32);
    path.lineTo(size.width, size.height* 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {return true;}
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderCurvoPainter(),
        ),
      );
  }
}

class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .stroke .fill
    paint.strokeWidth = 10;
    final path = Path();

    //Dibujar con el path y el paint
    path.lineTo(0, size.height* 0.25);
    path.quadraticBezierTo(size.width*0.5, size.height*0.40, size.width, size.height* 0.25);
    //path.lineTo(size.width, size.height* 0.25);
    path.lineTo(size.width, 0);


    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {return true;}
}

class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderWavePainter(),
        ),
      );
  }
}

class _HeaderWavePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .stroke .fill
    paint.strokeWidth = 10;
    final path = Path();

    //Dibujar con el path y el paint
    path.lineTo(0, size.height* 0.25);
    path.quadraticBezierTo(size.width*0.25, size.height*0.35, size.width*0.5, size.height* 0.25);
    path.quadraticBezierTo(size.width*0.75, size.height*0.15, size.width, size.height* 0.25);
    path.lineTo(size.width, 0);
    
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {return true;}

}

class HeaderWaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderWaveGradientPainter(),
        ),
      );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: Offset(0, 55),
      radius: 200
    );

    final Gradient gradiente = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
        Color(0xff6D01AF),
      ],
      stops: [
        0.1,
        0.7,
        0.9,
        1.0,
      ]
    
    );

    final paint = Paint()..shader = gradiente.createShader(rect);
    // Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; // .stroke .fill
    paint.strokeWidth = 10;
    final path = Path();

    //Dibujar con el path y el paint
    path.lineTo(0, size.height* 0.25);
    path.quadraticBezierTo(size.width*0.25, size.height*0.35, size.width*0.5, size.height* 0.25);
    path.quadraticBezierTo(size.width*0.75, size.height*0.15, size.width, size.height* 0.25);
    path.lineTo(size.width, 0);
    
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {return true;}

}

class IconHeader extends StatelessWidget {
  IconHeader({Key key, @required this.icon, @required this.title, @required this.subtitle, this.color1=Colors.grey, this.color2=Colors.blueGrey});
  
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(0.7);
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(color1: this.color1, color2:this.color2),
        Positioned(
          top: -50,
          left:-70,
          child: FaIcon(this.icon, size: 250, color: Colors.white.withOpacity(0.2),)),
        Column(
          children: <Widget>[
            SizedBox(height: 80, width: double.infinity,),
            Text(this.subtitle, style: TextStyle(color: colorBlanco),),
            SizedBox(height: 20),
            Text(this.title, style: TextStyle(color: colorBlanco, fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            FaIcon(this.icon, size: 90, color: Colors.white),
          ],
        ),
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  const _IconHeaderBackground({
    Key key, this.color1, this.color2,
  }) : super(key: key);
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
           this.color1,
           this.color2,
        ])
      ),
    );
  }
}