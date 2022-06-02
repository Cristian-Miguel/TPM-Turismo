import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../barra_inferior/barrainf.dart';

import '../../barra_inferior/barrainf.dart' as barra;

class Hotel extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Hotel();
  }
}

class _Hotel extends State<Hotel>{
  var idUser = barra.idUser;

  final _nombreInputTextController = TextEditingController();
  final _descripcionInputTextController = TextEditingController();
  final _costoInputTextController = TextEditingController();
  final _numerohabitacionInputTextController = TextEditingController();
  final _estadoInputTextController = TextEditingController();
  final _ciudadInputTextController = TextEditingController();
  final _coloniaInputTextController = TextEditingController();
  final _calleInputTextController = TextEditingController();
  final _numeroInputTextController = TextEditingController();
  final _codigopostalInputTextController = TextEditingController();
  final _telefonoInputTextController = TextEditingController();
  final _ImagenInputTextController = TextEditingController();
  Object _tipohabitacionInputTextController = "";
  Object _categoriaInputTextController = "";
  var  imagen = 'https://th.bing.com/th/id/R.14e9e47f7f572b224536073376637abc?rik=NS%2fonGxy7fu35Q&riu=http%3a%2f%2fwww.agloval.com%2fwp-content%2fuploads%2f2017%2f04%2fcrystal_gris_claro.jpg&ehk=GrrIvNmGIJli3WVrOt7KZk5E%2fu2a4YQpBjwqt1C%2bkEQ%3d&risl=&pid=ImgRaw&r=0';
  var imagenes = [
    'https://th.bing.com/th/id/OIP.WgE46Tyz1KrK3qnuZnwi2wAAAA?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.WgE46Tyz1KrK3qnuZnwi2wAAAA?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.WgE46Tyz1KrK3qnuZnwi2wAAAA?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.WgE46Tyz1KrK3qnuZnwi2wAAAA?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.WgE46Tyz1KrK3qnuZnwi2wAAAA?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.WgE46Tyz1KrK3qnuZnwi2wAAAA?pid=ImgDet&rs=1',
  ];

  Object CatselectedValue = "Familiar";
  List<DropdownMenuItem<String>> get CatdropdownItems{
    const List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Familiar"),          value: "Familiar"),
      DropdownMenuItem(child: Text("Urbano"),            value: "Urbano"),
      DropdownMenuItem(child: Text("Monumento"),         value: "Monumento"),
      DropdownMenuItem(child: Text("Low cost"),          value: "Low cost"),
      DropdownMenuItem(child: Text("Balneario"),         value: "Balneario"),
      DropdownMenuItem(child: Text("Albergue turistico"),value: "Albergue turistico"),
      DropdownMenuItem(child: Text("De apartamento"),    value: "De apartamento"),
      DropdownMenuItem(child: Text("De naturaleza"),     value: "De naturaleza"),
      DropdownMenuItem(child: Text("De aeropuerto"),     value: "De aeropuerto"),
      DropdownMenuItem(child: Text("Pasada"),            value: "Pasada"),
    ];
    return menuItems;
  }

  Object TipoHabselectedValue = "Quad";
  List<DropdownMenuItem<String>> get TipoHabdropdownItems{
    const List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Quad"),       value: "Quad"),
      DropdownMenuItem(child: Text("Triple"),     value: "Triple"),
      DropdownMenuItem(child: Text("Doble"),      value: "Doble"),
      DropdownMenuItem(child: Text("Individual"), value: "Individual"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateControllers,
        child:ListView(
        scrollDirection: Axis.vertical,
        children:<Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20, top:20, bottom: 20),
              child: const Text(
                  "Agregar Hotel",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 28, top:10),
                  child: const Text(
                    "Nombre",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 13, right: 13),
                  margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(93, 93, 93, 0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: _nombreInputTextController,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      hintText: '...',
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Descripción",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Container(
                height: Theme.of(context).textTheme.bodyText1!.fontSize! * 20,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 13, right: 13, top:8, bottom: 8),
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(93, 93, 93, 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  textAlign: TextAlign.left,
                  controller: _descripcionInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Costo",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 13, right: 13),
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(93, 93, 93, 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child:  TextField(
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  controller: _costoInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10, bottom: 10),
                child: const Text(
                  "Imagen",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 110,
                    height: 110,
                    // color: const Color.fromRGBO(234, 234, 234, 1.0),
                    margin: const EdgeInsets.only(left: 10, top:5, bottom: 5),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(220, 220, 220, 1.0),  //PARA PROBAR CONTAINER
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(imagenes[0]),
                            fit: BoxFit.cover,
                          ),
                      ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // shape: new RoundedRectangleBorder(
                        //       borderRadius: new BorderRadius.circular(10.0),
                        //   ),
                        primary: Colors.pinkAccent.withOpacity(0.0),
                        onPrimary: Colors.white.withOpacity(0.0),
                        // side: BorderSide(color: Colors.red, width: 1),
                      ),
                      onPressed: ()=>{_showModal(0),},
                      child: const Text(
                          'Agregar',
                          style: TextStyle(
                          color: Colors.white,
                          ),
                        ),
                      ),
                  ),
                  Container(
                      width: 110,
                      height: 110,
                      // color: const Color.fromRGBO(234, 234, 234, 1.0),
                      margin: const EdgeInsets.only(left: 10, right: 10, top:5, bottom: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(220, 220, 220, 1.0),  //PARA PROBAR CONTAINER
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(imagenes[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent.withOpacity(0.0),
                        onPrimary: Colors.white.withOpacity(0.0),
                      ),
                      onPressed: ()=>{_showModal(1),},
                      child: const Text(
                        'Agregar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: 110,
                      height: 110,
                      // color: const Color.fromRGBO(234, 234, 234, 1.0),
                      margin: const EdgeInsets.only( right: 10, top:5, bottom: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(220, 220, 220, 1.0), //PARA PROBAR CONTAINER
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(imagenes[2]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent.withOpacity(0.0),
                        onPrimary: Colors.white.withOpacity(0.0),
                      ),
                      onPressed: ()=>{_showModal(2),},
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 110,
                      height: 110,
                      // color: const Color.fromRGBO(234, 234, 234, 1.0),
                      margin: const EdgeInsets.only(left: 10, top:5, bottom: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(220, 220, 220, 1.0),  //PARA PROBAR CONTAINER
                        borderRadius: BorderRadius.circular(10.0),
                        image:  DecorationImage(
                          image: NetworkImage(imagenes[3]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent.withOpacity(0.0),
                        onPrimary: Colors.white.withOpacity(0.0),
                      ),
                      onPressed: ()=>{_showModal(3),},
                      child: const Text(
                        'Agregar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: 110,
                      height: 110,
                      // color: const Color.fromRGBO(234, 234, 234, 1.0),
                      margin: const EdgeInsets.only(left: 10, right: 10, top:5, bottom: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(220, 220, 220, 1.0),  //PARA PROBAR CONTAINER
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(imagenes[4]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent.withOpacity(0.0),
                        onPrimary: Colors.white.withOpacity(0.0),
                      ),
                      onPressed: ()=>{_showModal(4),},
                      child: const Text(
                        'Agregar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: 110,
                      height: 110,
                      // color: const Color.fromRGBO(234, 234, 234, 1.0),
                      margin: const EdgeInsets.only( right: 10, top:5, bottom: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(220, 220, 220, 1.0),  //PARA PROBAR CONTAINER
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(imagenes[5]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent.withOpacity(0.0),
                        onPrimary: Colors.white.withOpacity(0.0),
                      ),
                      onPressed: ()=>{ _showModal(5), },
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

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Tipo de habitacion",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(93, 93, 93, 0.1),
                            width: 0
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            // color: Color.fromRGBO(93, 93, 93, 0.1),
                            width: 0
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(93, 93, 93, 0.1),
                    ),
                    dropdownColor: const Color.fromRGBO(234, 234, 234, 1.0),
                    value: TipoHabselectedValue,
                    onChanged: (Object? value) {
                      setState(() {
                        TipoHabselectedValue = value!;
                        _tipohabitacionInputTextController = value;
                      });
                    },
                    items: TipoHabdropdownItems
                ),
              )
            ],
          ),

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Categoria",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(93, 93, 93, 0.1),
                            width: 0
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          // color: Color.fromRGBO(93, 93, 93, 0.1),
                            width: 0
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(93, 93, 93, 0.1),
                    ),
                    dropdownColor: const Color.fromRGBO(234, 234, 234, 1.0),
                    value: CatselectedValue,
                    onChanged: (Object? value) {
                      setState(() {
                        CatselectedValue = value!;
                        _categoriaInputTextController = value;
                      });
                    },
                    items: CatdropdownItems
                ),
              )
            ],
          ),

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Número de habitaciones",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 13, right: 13),
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(93, 93, 93, 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  controller: _numerohabitacionInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),

          const Divider(
            color: Colors.black38,
          ),

          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left: 20, top:20, bottom: 20),
            child: const Text(
              "Conforme a ubicación",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Estado",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 13, right: 13),
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(93, 93, 93, 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  textAlign: TextAlign.left,
                  controller: _estadoInputTextController,
                  decoration:const  InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Ciudad",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 13, right: 13),
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(93, 93, 93, 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  textAlign: TextAlign.left,
                  controller: _ciudadInputTextController,
                  decoration:const  InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Colonia",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 13, right: 13),
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(93, 93, 93, 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  textAlign: TextAlign.left,
                  controller: _coloniaInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Calle",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 13, right: 13),
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(93, 93, 93, 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  textAlign: TextAlign.left,
                  controller: _calleInputTextController,
                  decoration:const  InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Número",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 13, right: 13),
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(93, 93, 93, 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  controller: _numeroInputTextController,
                  decoration:const  InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Código Postal",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 13, right: 13),
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(93, 93, 93, 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  controller: _codigopostalInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Teléfono",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 13, right: 13),
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(93, 93, 93, 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  controller: _telefonoInputTextController,
                  decoration: const InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: Theme.of(context).textTheme.bodyText1!.fontSize! * 10.5,
                margin: const EdgeInsets.only(left:0, right: 6, top: 20, bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    primary: Colors.white54,
                    onPrimary: Colors.white,
                    // side: BorderSide(color: Colors.red, width: 1),
                  ),
                  //Redirigimos al home importando BarraInferior de otro .dart
                  onPressed: () =>{
                  Navigator.of(context).push(
                  MaterialPageRoute(
                  builder:(context)
                  {
                  return BarraInferior();
                  }
                  )
                  )
                  },
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
                margin: const EdgeInsets.only(left:6, right: 0, top: 20, bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    primary: Colors.pinkAccent,
                    onPrimary: Colors.white,
                    // side: BorderSide(color: Colors.red, width: 1),
                  ),
                  onPressed: _sendControllers,
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
    )
    );
  }

  void _updateControllers(){
    final controllers = [
      _nombreInputTextController,
      _descripcionInputTextController,
      _categoriaInputTextController,
      _costoInputTextController,
      _numerohabitacionInputTextController,
      _tipohabitacionInputTextController,
      _numeroInputTextController,
      _calleInputTextController,
      _coloniaInputTextController,
      _ciudadInputTextController,
      _estadoInputTextController,
      _codigopostalInputTextController,
      _telefonoInputTextController,
    ];
    agregarHotel(controllers);
  }


  void agregarHotel(controllers) async {
    var nombre = controllers[0];
    var descripcion = controllers[1];
    var categoria = controllers[2];
    var costo = controllers[3];
    var numeroHab = controllers[4];
    var tipoHab = controllers[5];
    var numeroExt = controllers[6];
    var calle = controllers[7];
    var colonia = controllers[8];
    var ciudad = controllers[9];
    var estado = controllers[10];
    var codigoPostal = controllers[11];
    var telefono = controllers[12];

    var urlHotel = Uri.parse('http://10.0.2.2:4000/Agregar/Hotel');

    late List hoteles = [];
    var response;

    if(_verifyData(nombre,descripcion,categoria,costo,numeroHab,tipoHab,numeroExt,calle,
        colonia,ciudad,estado,codigoPostal,telefono,context)){
      try{
        response = await http.post(urlHotel, body: {'nombre': '$nombre', 'descripcion': '$descripcion',
          'categoria': '$categoria', 'costo': '$costo','numeroHab': '$numeroHab','tipoHab': '$tipoHab',
          'numeroExt': '$numeroExt', 'calle': '$calle', 'colonia': '$colonia', 'ciudad': '$ciudad',
          'estado': '$estado', 'codigoPostal': '$codigoPostal', 'idUser': '$idUser'
        });

        if(json.decode(response.body)['row'].toString() != 'null'){
          hoteles = List<Map<String, dynamic>>.from(json.decode(response.body)['row']);
        }

      }catch(_){
        _alert('Datos incorrectos',context);
      }
    }
  }

  bool _verifyData(nombre,descripcion,categoria,costo,numeroHab,tipoHab,numeroExt,calle,
      colonia,ciudad,estado,codigoPostal,telefono,context){
    if(nombre == '' || descripcion == '' || categoria == '' || costo == '' || costo == '' || numeroHab == ''
    || tipoHab == '' || numeroExt == '' || calle == '' || colonia == '' || ciudad == '' || estado == '' ||
    codigoPostal == '' || telefono == ''){
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

  void _sendControllers(){
    debugPrint(_nombreInputTextController.toString());
  }

  Future<String?> _showModal(int index) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Agregar imagen'),
        actions: <Widget>[

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Ingrese el URL de la imagen",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 13, right: 13),
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(93, 93, 93, 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  textAlign: TextAlign.left,
                  controller: _ImagenInputTextController,
                  decoration:const  InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () => {
                  _ImagenInputTextController.text = '',
                  Navigator.pop(context, 'Cancel'),
                },
                child: const Text('Cancel'),
              ),

              TextButton(
                onPressed: () => {
                  _getImage(index),
                  Navigator.pop(context, 'Guardar'),
                },
                child: const Text('Guardar'),
              ),
            ],
          ),

        ],
      ),
    );
  }

  void _getImage(int index) {
    setState(() {
        imagenes[index] = _ImagenInputTextController.value.text.toString();
        _ImagenInputTextController.text = '';
    });
  }

}