import 'package:flutter/material.dart';
import '../utils/scroll_behavior.dart';

class CustomPageViews extends StatelessWidget {
  const CustomPageViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController();
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.7,
      child: PageView.builder(
        scrollBehavior: MyCustomScrollBehavior(),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        controller: _controller,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Icon(
                  Icons.abc,
                  size: 500,
                ),
              ),
              SizedBox(
                width: 300,
                child: Text(
                    'Excepteur proident consectetur id occaecat id ea enim tempor non pariatur id sunt occaecat mollit. Velit ea consectetur aliquip nostrud minim in qui ex velit est deserunt. Voluptate fugiat aute veniam cillum et ea. Nisi ea tempor nulla enim occaecat cupidatat. Laboris ea aliquip proident ex laborum qui nulla aliquip. Ullamco non veniam mollit duis do deserunt sit.'),
              ),
            ],
          );
        },
      ),
    );
  }
}
