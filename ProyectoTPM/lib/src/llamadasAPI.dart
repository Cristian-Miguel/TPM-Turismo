import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIfunctions{

  void registrar(user,name,apeP,apeM,cumple,rfc,foto,pass,email,tipo,context) async{
    var dirRegistrar = Uri.parse('http://localhost:4000/Usuarios/Registrar/');
    var dirRepetido = Uri.parse('http://localhost:4000/Usuarios/Repetido/');
    var response;

    try{
      response = await http.post(dirRepetido, body: {'email': 'mike@email.com'});

      if(json.decode(response.body)['row'].toString() != 'null') _alert("El email ya se encuentra registrado", context);
      else{
        response = await http.post(dirRegistrar, body: {
          'email': '$email',
          'pass': '$pass',
          'user': '$user',
          'name': '$name',
          'apeP': '$apeP',
          'apeM': '$apeM',
          'cumple': '$cumple',
          'rfc': '$rfc',
          'foto': '$foto',
          'tipo': '$tipo'
        });

        if(json.decode(response.body)['row'].toString() != 'null'){
          _alert("Usuario registrado con exito", context);
        }else _alert("Error al registrar", context);
      }
    }catch(_){
      _alert("Error al conectar", context);
    }
  }

  void _alert(message,context){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(message, style: Theme.of(context).textTheme.headline6),
        actions: <Widget>[
          TextButton(
            child: const Text('Volver'),
            onPressed: () => Navigator.pop(context, 'Cancel'),
          ),
        ],
      );
    });
  }

}