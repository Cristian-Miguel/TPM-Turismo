import 'package:flutter/material.dart';

class Mensajes extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Mensajes();
  }
}

class _Mensajes extends State<Mensajes>{
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Mensajes'),
    );
  }
}