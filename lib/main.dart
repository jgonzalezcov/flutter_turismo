import 'package:flutter/material.dart';
import 'package:tourist/screens/home/home_view.dart';
import 'package:tourist/widgets/header.widget.dart';

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
      title: 'Tourist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: Center(
        child: Stack(
          children: [
            Positioned(
              top: 0, // Coloca el encabezado en la parte superior
              left: 0,
              right: 0,
              height: 120, // Altura del encabezado
              child:
                  HeaderWidget(textHeader: 'Turismo Chile', heightHeader: 120),
            ),
            Positioned(
              top: 0, // Deja espacio para el encabezado
              left: 0,
              right: 0,
              bottom: 0,
              child: HomeView(),
            ),
          ],
        ),
      ),
    ));
  }
}
