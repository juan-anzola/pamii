import 'package:flutter/material.dart';
import 'package:pamii_mobile/pages/login_page.dart';

void main() => runApp(const Pamii());

class Pamii extends StatelessWidget {
  const Pamii({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',  
      debugShowCheckedModeBanner: false,
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: 'login',
      routes: {'login': (_) => const LoginPage()},
    );
  }
}
