import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import '../barra_inferior/barrainf.dart';
import 'dart:convert';

class sesionFunctions{
  var session = FlutterSession();
  late bool isLoginG = false;
  late var nameG = "";
  late var tipoG = "";
  late var idG = 0;

  //Llamar a esta función para iniciar sesión
  void getUser(email,pass,context) async {
    var userName;
    var idUser;
    var tipo;

    //var urlUsers = Uri.parse('http://localhost:4000/Usuarios/LogIn/');
    var urlUsers = Uri.parse('http://10.0.2.2:4000/Usuarios/LogIn/');
    late List users = [];
    var response;

    if(_verifyData(email,pass,context)){
      try{
        response = await http.post(urlUsers, body: {'email': '$email', 'pass': '$pass'});

        if(json.decode(response.body)['row'].toString() != 'null'){
          users = List<Map<String, dynamic>>.from(json.decode(response.body)['row']);
        }

        userName = users.first['Usuario'].toString();
        idUser = int.parse(users.first['idUsuario'].toString());
        tipo = users.first['TipoUsuario'].toString();
        print('Nombre: $userName, ID: $idUser, Tipo: $tipo');
        _startSession(userName, idUser, tipo);
        probarSesion2();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BarraInferior()), // this mainpage is your page to refresh
              (Route<dynamic> route) => false,
        );
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

  void _startSession(user,idUser,tipo){
    session.set("isLogin", true);
    session.set("user", user);
    session.set("idUser", idUser);
    session.set("tipo", tipo);
    print('Sesion Iniciada');
  }

  void closeSession(context){
    session.set("isLogin", false);
    session.set("user", "0");
    session.set("idUser", 0);
    session.set("tipo", "Turista");
    _alert('Sesión cerrada',context);
  }

  void probarSesion() async {
    bool isLogin = await session.get("isLogin");
    var name = await session.get("user");
    var id = await session.get("idUser");
    var tipo = await session.get("tipo");

    probarSesion2();
    print('isLogin: $isLogin, Nombre: $name, ID: $id, Tipo: $tipo');
    Future.delayed(Duration(seconds: 1), () {print(isLoginG);});
    //Future.delayed(Duration(seconds: 1), () {});
  }

  void probarSesion2() async{
    isLoginG = await session.get("isLogin");
    tipoG = await session.get("tipo");
    nameG = await session.get("user");
    idG = await session.get("idUser");
  }
}