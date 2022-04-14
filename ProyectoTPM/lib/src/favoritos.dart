import 'package:flutter/material.dart';

class Favoritos extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Favoritos();
  }
}

class _Favoritos extends State<Favoritos>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favoritos'),
    );
  }
}