import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class sesionFunctions{
  var session = FlutterSession();

  //Llamar a esta función para iniciar sesión
  void getUser(email,pass,context) async {
    var userName;
    var idUser;

    var urlUsers = Uri.parse('http://localhost:4000/Usuarios/LogIn/');
    late List users = [];
    var response;

    if(_verifyData(email,pass,context)){
      try{
        response = await http.post(urlUsers, body: {'email': '$email', 'pass': '$pass'});

        if(json.decode(response.body)['row'].toString() != 'null'){
          users = List<Map<String, dynamic>>.from(json.decode(response.body)['row']);
        }

        userName = users.first['Usuario'].toString();
        idUser = int.parse(users.first['idUsuarios'].toString());
        print('Nombre: $userName, ID: $idUser');
        _startSession(userName, idUser);
      }catch(_){
        _alert('Datos incorrectos',context);
      }
    }

  }

  bool _verifyData(email,pass,context){
    if(email == '' || pass == ''){
      _alert('Los campos no pueden estar vacios',context);
      return false;
    }else return true;
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

  void _startSession(user,idUser){
    session.set("isLogin", true);
    session.set("user", user);
    session.set("idUser", idUser);
    print('Sesion Iniciada');
  }

  void closeSession(context){
    session.set("isLogin", false);
    session.set("user", '0');
    session.set("idUser", 0);
    _alert('Sesión cerrada',context);
  }

  void probarSesion() async {
    bool isLogin = await session.get("isLogin");
    var name = await session.get("user");
    var id = await session.get("idUser");
    print(isLogin);
    print(name);
    print(id);
  }
}