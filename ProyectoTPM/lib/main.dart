import 'package:flutter/material.dart';
import 'barra_inferior/barrainf.dart';
import 'package:flutter_session/flutter_session.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Turismo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var session = FlutterSession();

  @override
  Widget build(BuildContext context) {
    _startSession();
    return BarraInferior();
    //   Scaffold(
    //     bottomNavigationBar: NeumorphicBottomNav(),
    // );
  }

  void _startSession(){
    session.set("isLogin", false);
    session.set("user", '0');
    session.set("idUser", 0);
  }
}

// SafeArea(
// child: Scaffold(
// resizeToAvoidBottomInset: false,
// body: Padding(
// padding: const EdgeInsets.all(10.0),
// child: Column(
// mainAxisSize: MainAxisSize.max,
// children: [
// Expanded(
// child: Align(
// alignment: Alignment.bottomCenter,
// child: NeumorphicBottomNav(),
// ),
// )
// ],
// ),
// ),
// ),
// );