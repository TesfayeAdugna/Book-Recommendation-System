import 'package:flutter/material.dart';
import 'features/features.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignUpPage.route,
      onGenerateRoute: PageRouter.generateRoute,);
  }
}
