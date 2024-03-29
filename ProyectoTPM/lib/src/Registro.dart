import 'package:flutter/material.dart';
import 'llamadasAPI.dart';
import 'package:date_field/date_field.dart';

class Registro extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Registro();
  }
}

class _Registro extends State<Registro>{
  var api = APIfunctions();
  final _userInputTextController = TextEditingController();
  final _nameInputTextController = TextEditingController();
  final _lastnamefirstInputTextController = TextEditingController();
  final _lastnamesecondInputTextController = TextEditingController();
  final _birthdateInputTextController = TextEditingController();
  final _rfcInputTextController = TextEditingController();
  final _photoInputTextController = TextEditingController();
  final _passwordInputTextController = TextEditingController();
  final _emailInputTextController = TextEditingController();
  Object _tipoUsuarioInputTextController = "";

  Object TipoUsuarioselectedValue = "Usuario";
  List<DropdownMenuItem<String>> get TipoUsuariodropdownItems{
    const List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Usuario"),          value: "Usuario"),
      DropdownMenuItem(child: Text("Empresa"),            value: "Urbano"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Container(
          child: const Text('Registrarse'),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 20, top: 20),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Nuevo Usuario",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Foto de Perfil",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(93, 93, 93, 0.1), borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _photoInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Nombre de usuario",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(93, 93, 93, 0.1), borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _userInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Nombre",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(93, 93, 93, 0.1), borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _nameInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Apellido Paterno",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(93, 93, 93, 0.1), borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _lastnamefirstInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Apellido Materno",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(93, 93, 93, 0.1), borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _lastnamesecondInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Fecha de nacimiento",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(93, 93, 93, 0.1), borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _birthdateInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "RFC",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(93, 93, 93, 0.1), borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _rfcInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Tipo de Usuario",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(93, 93, 93, 0.1),
                            width: 0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          // color: Color.fromRGBO(93, 93, 93, 0.1),
                            width: 0
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(93, 93, 93, 0.1),
                    ),
                    dropdownColor: const Color.fromRGBO(234, 234, 234, 1.0),
                    value: TipoUsuarioselectedValue,
                    onChanged: (Object? value) {
                      setState(() {
                        TipoUsuarioselectedValue = value!;
                        _tipoUsuarioInputTextController = value;
                      });
                    },
                    items: TipoUsuariodropdownItems
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Correo Electronico",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(93, 93, 93, 0.1), borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _emailInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Contraseña",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(left:12, right: 12, bottom: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(93, 93, 93, 0.1), borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _passwordInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: Theme.of(context).textTheme.bodyText1!.fontSize! * 10.5,
                    margin: const EdgeInsets.only(left:0, right: 6, top: 20, bottom: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: Colors.white54,
                        onPrimary: Colors.white,
                        // side: BorderSide(color: Colors.red, width: 1),
                      ),
                      onPressed: (){ Navigator.of(context).pop(); },
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: Theme.of(context).textTheme.bodyText1!.fontSize! * 14.5,
                    margin: const EdgeInsets.only(left:6, right: 0, top: 20, bottom: 30),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: Colors.pinkAccent,
                        onPrimary: Colors.white,
                        // side: BorderSide(color: Colors.red, width: 1),
                      ),
                      onPressed: (){
                        if(!vacio()){
                          Navigator.of(context).pop();
                          api.registrar(
                            _userInputTextController.text,
                            _nameInputTextController.text,
                            _lastnamefirstInputTextController.text,
                            _lastnamesecondInputTextController.text,
                            _birthdateInputTextController.text,
                            _rfcInputTextController.text,
                            _photoInputTextController.text,
                            _passwordInputTextController.text,
                            _emailInputTextController.text,
                            _tipoUsuarioInputTextController.toString().isEmpty ? "Usuario" : _tipoUsuarioInputTextController,
                             context);
                        }
                      },
                      child: const Text(
                        'Registrar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool vacio(){
    if(_emailInputTextController.text == "" ||
    _passwordInputTextController.text == "" ||
    _userInputTextController.text == ""){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text("Email, Contraseña y Usuario no pueden estar vacios", style: Theme.of(context).textTheme.headline6),
          actions: <Widget>[
            TextButton(
              child: const Text('Volver'),
              onPressed: () => Navigator.pop(context, 'Cancel'),
            ),
          ],
        );
      });

      return true;
    }
    else return false;
  }
}