import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webportfolio/src/pages/intro_page.dart';
import 'package:webportfolio/src/providers/ui_provider.dart';

import '../widgets/custom_footer.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/custom_views.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final uiProvider = Provider.of<UiProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomNavbar(),
              uiProvider.pageSelected == 0
                  ? FadeInUp(
                      duration: const Duration(milliseconds: 500),
                      child: const IntroPage(),
                    )
                  : FadeInLeft(
                      duration: const Duration(milliseconds: 500),
                      child: const CustomPageViews(),
                    ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
