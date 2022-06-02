import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyectotmp/src/EmpresaViews/AgregarViaje.dart';

class ListarViajes extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ListarViajes();
  }
}

class _ListarViajes extends State<ListarViajes> {

  late List ServiciosData = [];
  late List ServiciosV = [];

  int activeIndex= 0;

  //obtenemos los datos de la api
  getReservas() async {

    //para telefono
    // var url = Uri.parse('http://10.0.2.2:4000/servicios/Viajes');

    // para web
    var url = Uri.parse('http://localhost:4000/servicios/Viajes');
    var response = await http.get(url);

    if(json.decode(response.body)['row'].toString() != 'null'){
      ServiciosV = List<Map<String, dynamic>>.from(json.decode(response.body)['row']);
    }

    setState(() {
      ServiciosData.addAll(ServiciosV);
    });
  }

  //constructor tara inicializar el getFavoritos
  @override
  void initState() {
    super.initState();
    getReservas();
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
                "Viajes",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ServiciosData.isEmpty ? DataTableNull() :  DataTablewithData(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onChangeRegistro,
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add),
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

  DataTablewithData(){
    return  DataTable(

      columns: const <DataColumn>[
        DataColumn(
          label: Text('id'),
        ),
        DataColumn(
          label: Text('Nombre'),
        ),
        DataColumn(
          label: Text('Acciones'),
        ),
      ],
      rows: List<DataRow>.generate(
        ServiciosData == null ? 0 : ServiciosData.length,
            (int index) => DataRow(
          cells: <DataCell>[
            DataCell(Text(ServiciosData[index]["idViaje"].toString())),
            DataCell(Text(ServiciosData[index]["Nombre"].toString())),
            DataCell(
                Row(
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.centerLeft,
                      onPressed: (){},
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.centerLeft,
                      onPressed: (){},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),

                    IconButton(
                      alignment: Alignment.centerLeft,
                      onPressed: (){},
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

  void _onChangeRegistro(){
    Navigator.of(context).push(
        MaterialPageRoute(
            builder:(context)
            {
              return Scaffold(
                appBar: AppBar(
                    title: const Text('Agregar Viaje', style: TextStyle(color: Colors.black),),
                    backgroundColor: Colors.white,
                    //centerTitle: true,
                    iconTheme: const IconThemeData(color: Colors.black)
                ),
                body:AgregarViaje(),
              );
            }
        )
    );
  }
}
