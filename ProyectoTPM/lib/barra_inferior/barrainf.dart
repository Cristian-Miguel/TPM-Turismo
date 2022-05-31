import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proyectotmp/src/descubrir.dart';
import 'package:proyectotmp/src/favoritos.dart';
import 'package:proyectotmp/src/home.dart';
import 'package:proyectotmp/src/reservas.dart';
import 'package:proyectotmp/src/mensajes.dart';
import 'package:proyectotmp/src/perfil.dart';
import 'package:proyectotmp/src/LogIn.dart';
import 'package:proyectotmp/src/sesion.dart';

import '../src/EmpresaViews/Hotel.dart';
import '../src/EmpresaViews/Viaje.dart';
import '../src/EmpresaViews/Restaurante.dart';
import '../src/EmpresaViews/Tour.dart';
import '../src/EmpresaViews/Paquete.dart';
import 'package:flutter_session/flutter_session.dart';

class BarraInferior extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return BarraInferiorMenu();
  }
}

class BarraInferiorMenu extends State<BarraInferior>{
  var session = FlutterSession();
  var tipo = "";
  bool isLogin = false;
  var user = "";
  var idUser = 0;

  int indexTap = 0;
  int indexPage = 0;
  bool colorChange = false;
  //aqui checar interfaces por si se les ofrece
  final List<Widget> widgetsChildren = [
    Home(),
    Descubrir(),
    Reservas(),
    Mensajes(),
    Perfil(),
    Favoritos(),
    Hotel(),
    Viaje(),
    Restaurante(),
    Tour(),
    Paquete(),
    LogIn(),
  ];

  void onTapTapped (int index,bool color){
    setState(() {
      indexPage  = index;
      indexTap = 0;
      colorChange = color;
    });
  }

  void updateUser() async{
    tipo = await session.get("tipo");
    isLogin = await session.get("isLogin");
    user = (await session.get("user")).toString();
    idUser = await session.get("idUser");
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      updateUser();
      setState(() {
        tipo;
        isLogin;
        user;
        idUser;
      });
    });

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const DrawerHeader(
              child: Center(
                child: Text(
                  'Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                "Usuario",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () =>{
                onTapTapped(0,true),
                Navigator.of(context).pop(),
              }
            ),
            ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favoritos'),
                onTap: () => {
                  onTapTapped(5,true),
                  Navigator.of(context).pop(),
                }
            ),
            if(tipo == "Administrador" || tipo == "Empresa") panelEmpresa() as Column,

            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                "General",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.login),
                title: Text('Log In'),
                onTap: () => {
                  onTapTapped(11,true),
                  Navigator.of(context).pop(),
                }
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {Navigator.pop(context,LogIn())},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(93, 93, 93, 0.1), borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    // icon: Icon(Icons.clear),
                    icon: Icon(Icons.search),
                    color: Colors.pinkAccent,
                    onPressed: () {
                      // FocusScope.of(context).dispose();
                      // Navigator.of(context).pop();
                    },
                  ),
                  hintText: '¿Qué quieres vivir?...',
                  border: InputBorder.none,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: colorChange ? widgetsChildren[indexPage] : widgetsChildren[indexTap],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => {
              setState(() {
                indexTap = index;
                colorChange = false;
              })
            },
          currentIndex: indexTap,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: colorChange ? Colors.black54 : Colors.pinkAccent,
          iconSize: 25.0,
          selectedFontSize: 14.0,
          unselectedFontSize: 12.0,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Descubrir',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Reservas',
              icon: Icon(Icons.send),
            ),
            BottomNavigationBarItem(
              label: 'Mensajes',
              icon: Icon(Icons.message),
            ),
            BottomNavigationBarItem(
              label: 'Perfil',
              icon: Icon(Icons.account_circle_outlined),
            ),
          ]
      ),
    );
  }

  Column panelEmpresa(){
    return Column(children: <Widget>[
      Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 20),
        child: const Text(
          "Empresa",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.hotel),
        title: Text('Agregar Hotel'),
        onTap: () => {
          onTapTapped(6,true),
          Navigator.of(context).pop()
        },
      ),
      ListTile(
        leading: Icon(Icons.airplanemode_on_sharp),
        title: Text('Agregar Viaje'),
        onTap: () => {
          onTapTapped(7,true),
          Navigator.of(context).pop()
        },
      ),
      ListTile(
        leading: Icon(Icons.fastfood),
        title: Text('Agregar Restaurante'),
        onTap: () => {
          onTapTapped(8,true),
          Navigator.of(context).pop()
        },
      ),

      ListTile(
        leading: Icon(Icons.airport_shuttle_sharp),
        title: Text('Agregar Tour'),
        onTap: () => {
          onTapTapped(9,true),
          Navigator.of(context).pop()
        },
      ),
      ListTile(
        leading: Icon(Icons.backpack),
        title: Text('Agregar Paquete'),
        onTap: () => {
          onTapTapped(10,true),
          Navigator.of(context).pop()
        },
      ),
    ],);
  }

}
