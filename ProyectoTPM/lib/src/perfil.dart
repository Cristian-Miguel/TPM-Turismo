import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:proyectotmp/src/LogIn.dart';

class Perfil extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Perfil();
  }
}

class _Perfil extends State<Perfil>{

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Perfil'),
    );
  }
}