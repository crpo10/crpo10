import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webportfolio/src/services/email_services.dart';
import 'package:webportfolio/src/widgets/hover_widget.dart';
import 'package:webportfolio/src/widgets/input_field.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height * .7,
        width: size.width * .8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * .4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vamos a trabajar juntos!',
                    style: TextStyle(
                      fontSize: size.height * .09,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 25),
                    child: Text(
                      'Si estas interesado en trabajar conmigo puedes contactarme por mis redes sociales o enviarme un correo',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * .4,
              child: const ContactForm(),
            )
          ],
        ));
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController subjectCtrl = TextEditingController();
  final TextEditingController msgCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final services = Provider.of<EmailServices>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: InputField(
            label: 'Ingrese su Nombre',
            controller: nameCtrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: InputField(
            label: 'Ingrese su Correo',
            controller: emailCtrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: InputField(
            label: 'Sujeto',
            controller: subjectCtrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: InputField(
            label: 'Escribe un mensaje',
            controller: msgCtrl,
            multiLine: true,
          ),
        ),
        // falta validar state
        services.cargando
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Padding(
                padding: const EdgeInsets.all(35.0),
                child: OnHover(
                  builder: (value) {
                    final color = value ? Colors.white : Colors.white70;
                    final double move = value ? 20 : 8;

                    return GestureDetector(
                      onTap: () {
                        final Map data = {
                          "email": emailCtrl.text.trim().toLowerCase(),
                          "subject":
                              '${nameCtrl.text.trim()} = ${subjectCtrl.text.trim()}',
                          "body": msgCtrl.text.trim(),
                        };
                        services.sendEmail(data);
                      },
                      child: Row(
                        children: [
                          Text(
                            'Enviar',
                            style: TextStyle(
                              color: color,
                              fontSize: 25,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: move),
                            child: const Icon(Icons.arrow_forward),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
      ],
    );
  }
}
