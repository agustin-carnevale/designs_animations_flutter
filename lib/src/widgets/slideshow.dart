import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  const Slideshow(
      {Key key,
      @required this.slides,
      this.topDots = false,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey})
      : super(key: key);
  final List<Widget> slides;
  final bool topDots;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(builder: (BuildContext context) {
          final model = Provider.of<_SlideshowModel>(context);
          if (primaryColor != null) model.primaryColor = primaryColor;
          if (secondaryColor != null) model.secondaryColor = secondaryColor;
          return _BuildColumn(topDots: topDots, slides: slides);
        })),
      ),
    );
  }
}

class _BuildColumn extends StatelessWidget {
  const _BuildColumn({
    Key key,
    @required this.topDots,
    @required this.slides,
  }) : super(key: key);

  final bool topDots;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (topDots)
          _Dots(
            slides.length,
          ),
        Expanded(child: _Slides(slides)),
        if (!topDots)
          _Dots(
            slides.length,
          ),
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides(this.slides);
  final List<Widget> slides;

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key key,
    this.slide,
  }) : super(key: key);
  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots(this.count,);
  final count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            count,
            (index) => _Dot(
                  index,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot(
    this.index,
  );
  final int index;

  @override
  Widget build(BuildContext context) {
    final slideShowModel = Provider.of<_SlideshowModel>(context);

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 15,
      height: 15,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: slideShowModel.currentPage >= index - 0.5 &&
                slideShowModel.currentPage < index + 0.5
            ? slideShowModel.primaryColor
            : slideShowModel.secondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;

  double get currentPage => this._currentPage;
  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor(Color color) {
    this._primaryColor = color;
  }

  Color get secondaryColor => this._secondaryColor;
  set secondaryColor(Color color) {
    this._secondaryColor = color;
  }
}
