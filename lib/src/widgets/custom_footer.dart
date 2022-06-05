import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'custom_button.dart';
import 'hover_widget.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                    onPressed: () {},
                  );
                },
              ),
              OnHover(
                builder: (value) {
                  final color = value ? Colors.white : Colors.white70;

                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(
                          FontAwesomeIcons.twitter,
                          color: color,
                        ),
                      ),
                      CustomButton(
                        text: 'Twitter',
                        color: color,
                        onPressed: () {},
                      )
                    ],
                  );
                },
              ),
              OnHover(
                builder: (value) {
                  final color = value ? Colors.white : Colors.white70;
                  // Cambiar estructura de boton, TODO debe lanzar la función

                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(
                          FontAwesomeIcons.github,
                          color: color,
                        ),
                      ),
                      CustomButton(
                        text: 'GitHub',
                        color: color,
                        onPressed: () async {
                          if (!await launchUrlString(
                              'https://github.com/crpo10')) {
                            throw 'No se pudo abrir este link';
                          }
                        },
                      )
                    ],
                  );
                },
              ),
              OnHover(
                builder: (value) {
                  final color = value ? Colors.white : Colors.white70;

                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(
                          FontAwesomeIcons.linkedin,
                          color: color,
                        ),
                      ),
                      CustomButton(
                        text: 'LinKedIn',
                        color: color,
                        onPressed: () {},
                      )
                    ],
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
