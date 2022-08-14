import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webportfolio/src/providers/ui_provider.dart';
import 'package:webportfolio/src/routes/routes.dart';
import 'package:webportfolio/src/services/email_services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EmailServices(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio crpo10',
        routes: routes,
        initialRoute: 'home',
        theme: ThemeData.dark(),
      ),
    );
  }
}
