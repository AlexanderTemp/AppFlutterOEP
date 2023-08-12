import 'package:flutter/material.dart';
import "package:flutter_1/InicioSesion.dart";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xffdddddd),
        scaffoldBackgroundColor: Color(0xffdddddd),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryIconTheme: IconThemeData(color: Colors.white),
        useMaterial3: true,
      ),
      home: PantallaInicioSesion(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
