import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: FaIcon(
              FontAwesomeIcons.user,
              size: 300,
            ),
          ),
          SizedBox(
            width: 200,
          ),
          SizedBox(
            width: 300,
            child: Text(
              'Culpa ut ipsum duis ut irure Lorem est exercitation veniam labore amet. Tempor est laboris pariatur officia aliquip nisi anim sunt. Lorem pariatur cillum eu magna ullamco adipisicing cupidatat irure sit sunt adipisicing quis occaecat reprehenderit. Eu esse culpa esse culpa commodo irure ullamco laborum dolor.',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
