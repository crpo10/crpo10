import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webportfolio/src/providers/ui_provider.dart';

import 'custom_button.dart';
import 'hover_widget.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final uiProvider = Provider.of<UiProvider>(context);

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OnHover(
                builder: (value) {
                  final color = value ? Colors.white : Colors.white70;

                  return CustomButton(
                    text: 'Rafael Gómez',
                    fontSize: 25,
                    onPressed: () {
                      uiProvider.setPageSeleted = 0;
                    },
                    color: color,
                  );
                },
              ),
              OnHover(
                builder: (value) {
                  final color = value ? Colors.white : Colors.white70;

                  return CustomButton(
                    text: 'Flutter Developer',
                    color: color,
                    onPressed: () {
                      uiProvider.setPageSeleted = 1;
                    },
                  );
                },
              ),
              OnHover(
                builder: (value) {
                  final color = value ? Colors.white : Colors.white70;

                  return CustomButton(
                    text: 'Actualmente vivo en Venezuela',
                    onPressed: () {},
                    color: color,
                  );
                },
              ),
              SizedBox(
                width: size.width <= 780 ? size.width * 0.1 : size.width * .4,
              ),
              OnHover(
                builder: (value) {
                  final color = value ? Colors.white : Colors.white70;

                  return CustomButton(
                      text: 'CV',
                      fontSize: 20,
                      color: color,
                      onPressed: () async {
                        if (!await launchUrlString(
                            'https://res.cloudinary.com/crpo20/image/upload/v1655394833/zubhrracel12njo1riue.pdf')) {
                          throw 'No se pudo abrir este link';
                        }
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
