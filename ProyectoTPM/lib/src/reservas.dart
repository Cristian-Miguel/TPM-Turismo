import 'package:flutter/material.dart';

class Reservas extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Reservas();
  }
}

class _Reservas extends State<Reservas>{
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Reservaciones'),
    );
  }
}