import 'package:flutter/material.dart';
import 'package:neuro_vision_mobile/shared/shared.dart';
import 'package:neuro_vision_mobile/ui/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neuro Vision',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      // home: SignInScreen(),
      initialRoute: '/main',
      routes: {
        '/sign_in': (context) => const SignInScreen(),
        '/main': (context) => const MainScreen(),
      },
    );
  }
}
