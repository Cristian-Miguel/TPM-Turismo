import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'sesion.dart';
import 'dart:convert';

class LogIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _LogIn();
  }
}

class _LogIn extends State<LogIn>{
  late sesionFunctions sF = new sesionFunctions(); //Funcion para hacer uso de los procedimientos de sesion
  final _emailInputTextController = TextEditingController();
  final _passwordInputTextController = TextEditingController();
  var session = FlutterSession();
  var user;
  var idUser;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Log In', style: Theme.of(context).textTheme.headline4,),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              controller: _emailInputTextController,
              decoration: const InputDecoration(hintText: 'Correo'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              controller: _passwordInputTextController,
              decoration: const InputDecoration(hintText: 'Contraseña'),
            ),
          ),
          TextButton(
            onPressed: () => {sF.getUser(_emailInputTextController.text, _passwordInputTextController.text, context)},
            child: Text('Iniciar Sesión'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.blue;
              }),
            ),
          ),
          TextButton(
            onPressed: () => {sF.closeSession(context)},
            child: Text('Cerrar Sesión'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.blue;
              }),
            ),
          ),
          TextButton(
            onPressed: () => {sF.probarSesion()},
            child: Text('Probar Sesión'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.blue;
              }),
            ),
          ),
        ],
      ),
    );
  }
}