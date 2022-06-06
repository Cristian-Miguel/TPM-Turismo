import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyectotmp/barra_inferior/barrainf.dart' as barra;

class ListarUsuarios extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ListarUsuarios();
  }
}

class _ListarUsuarios extends State<ListarUsuarios> {
  late List Usuarios = [];
  late List ServiciosH = [];

  getUsuarios() async{
    //Para Celular
    //var url = Uri.parse("http://10.0.2.2:4000/Usuarios/Listar/");

    //Para web
    var url = Uri.parse("http://localhost:4000/Usuarios/Listar/");

    var response = await http.post(url);
    if(json.decode(response.body)['row'].toString() != 'null'){
      ServiciosH = List<Map<String, dynamic>>.from(json.decode(response.body)['row']);
    }

    setState(() {
      Usuarios.addAll(ServiciosH);
    });
  }

  @override
  void initState() {
    super.initState();
    getUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top:25 ,bottom: 10,right: 10, left: 10),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Reservas",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Usuarios.isEmpty ? DataTableNull() :  DataTableWithData(),
            ),
          ],
        ),
      ),
    );
  }

  DataTableNull(){
    return Container(
      margin: const EdgeInsets.only(top:50),
      alignment: Alignment.center,
      child: const Text(
        "Sin Datos Registrados",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  DataTableWithData(){
    return  DataTable(

      columns: const <DataColumn>[
        DataColumn(
          label: Text('id'),
        ),
        DataColumn(
          label: Text('Nombre'),
        ),
        DataColumn(
          label: Text('Correo'),
        ),
        DataColumn(
          label: Text('Tipo'),
        ),
        DataColumn(
          label: Text('Acciones'),
        ),
      ],
      rows: List<DataRow>.generate(
        Usuarios == null ? 0 : Usuarios.length,
            (int index) => DataRow(
          cells: <DataCell>[
            DataCell(Text(Usuarios[index]["idUsuario"].toString())),
            DataCell(Text(Usuarios[index]["Usuario"].toString())),
            DataCell(Text(Usuarios[index]["Email"].toString())),
            DataCell(Text(Usuarios[index]["TipoUsuario"].toString())),
            DataCell(
                Row(
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.centerLeft,
                      onPressed: (){
                        eliminarUsuario(Usuarios[index]["idUsuario"]);
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  eliminarUsuario(id) async{
    var url = Uri.parse('http://localhost:4000/Usuarios/Borrar/');
    //var response = await http.post(url);

   alerta("Usuario eliminado");
  }

  alerta(mensaje){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(mensaje, style: Theme.of(context).textTheme.headline6),
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