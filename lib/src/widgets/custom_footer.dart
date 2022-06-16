import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../providers/ui_provider.dart';
import 'custom_button.dart';
import 'hover_widget.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final uiService = Provider.of<UiProvider>(context);

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OnHover(
                builder: (value) {
                  final color = value ? Colors.white : Colors.white70;

                  return CustomButton(
                    text: 'rafaeljose3020@gmail.com',
                    color: color,
                    onPressed: () {
                      uiService.setPageSeleted = 2;
                    },
                  );
                },
              ),
              OnHover(
                builder: (value) {
                  final color = value ? Colors.white : Colors.white70;
                  // Cambiar estructura de boton, TODO debe lanzar la función

                  return GestureDetector(
                    onTap: () async {
                      if (!await launchUrlString(
                          'https://twitter.com/Rafael03418137')) {
                        throw 'No se pudo abrir este link';
                      }
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FaIcon(
                            FontAwesomeIcons.twitter,
                            color: color,
                          ),
                        ),
                        Text(
                          'Twitter',
                          style: TextStyle(color: color),
                        ),
                      ],
                    ),
                  );
                },
              ),
              OnHover(
                builder: (value) {
                  final color = value ? Colors.white : Colors.white70;
                  // Cambiar estructura de boton, TODO debe lanzar la función

                  return GestureDetector(
                    onTap: () async {
                      if (!await launchUrlString('https://github.com/crpo10')) {
                        throw 'No se pudo abrir este link';
                      }
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FaIcon(
                            FontAwesomeIcons.github,
                            color: color,
                          ),
                        ),
                        Text(
                          'GitHub',
                          style: TextStyle(color: color),
                        ),
                      ],
                    ),
                  );
                },
              ),
              OnHover(
                builder: (value) {
                  final color = value ? Colors.white : Colors.white70;
                  // Cambiar estructura de boton, TODO debe lanzar la función

                  return GestureDetector(
                    onTap: () async {
                      if (!await launchUrlString(
                          'https://www.linkedin.com/in/rafael-g%C3%B3mez-m%C3%A1rquez-b52914133/')) {
                        throw 'No se pudo abrir este link';
                      }
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: color,
                          ),
                        ),
                        Text(
                          'LinkedIn',
                          style: TextStyle(color: color),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                width: size.width <= 780 ? size.width * 0.1 : size.width * .4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
