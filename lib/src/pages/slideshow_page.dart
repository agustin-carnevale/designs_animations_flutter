import 'package:disenos_course/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SlideshowPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[300],
      body: Slideshow(
        slides: <Widget>[
          SvgPicture.asset('assets/svg/slides/slide-1.svg'),
          SvgPicture.asset('assets/svg/slides/slide-2.svg'),
          SvgPicture.asset('assets/svg/slides/slide-3.svg'),
          SvgPicture.asset('assets/svg/slides/slide-4.svg'),
          SvgPicture.asset('assets/svg/slides/slide-5.svg'),
        ],
        topDots: false,
        primaryColor: Colors.purple,
        secondaryColor: Colors.lightBlueAccent,
      ),
   );
  }
}