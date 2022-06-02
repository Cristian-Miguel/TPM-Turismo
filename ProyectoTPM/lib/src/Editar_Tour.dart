import 'package:flutter/material.dart';
import 'llamadasAPI.dart';

class Editar_Tour extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Editar_Tour();
  }
}

class _Editar_Tour extends State<Editar_Tour>{
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Container(
          child: const Text('Editar Tour'),
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
                  "Editar Tour",
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
                  "Descripción",
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
                  "Costo",
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
                  "Imagen 1",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: Theme.of(context).textTheme.bodyText1!.fontSize! * 10.5,
                    margin: const EdgeInsets.only(left:0, right: 6, top: 20, bottom: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
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
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        primary: Colors.pinkAccent,
                        onPrimary: Colors.white,
                        // side: BorderSide(color: Colors.red, width: 1),
                      ),
                      onPressed: (){
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
                            1, context);
                      },
                      child: const Text(
                        'Agregar',
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
}