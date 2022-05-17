import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class LogIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _LogIn();
  }
}

class _LogIn extends State<LogIn>{
  final _emailInputTextController = TextEditingController();
  final _passwordInputTextController = TextEditingController();
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
            //onPressed: _showDashboardScreen,
            onPressed: _getUser,
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
        ],
      ),
    );
  }

  void _getUser(){

  }

  void _startSession(){
    var session = FlutterSession();
    session.set("isLogin", true);
    session.set("user", user);
    session.set("idUser", idUser);
  }
}