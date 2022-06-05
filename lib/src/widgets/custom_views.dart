import 'package:flutter/material.dart';
import 'package:webportfolio/src/utils/proyects_list.dart';
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
        itemCount: projects.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(projects[index].imageName),
              ),
              SizedBox(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        projects[index].name,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),
                    Text(
                      projects[index].description,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
