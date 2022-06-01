import 'package:flutter/material.dart';

class Listar extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Listar();
  }
}

class _Listar extends State<Listar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Container(
            child: const Text('Registrarse'),
          ),
        ),
        body: Center(),
    );
  }
}