import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyectotmp/barra_inferior/barrainf.dart' as barra;

class ListarReservaciones extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ListarReservaciones();
  }
}

class _ListarReservaciones extends State<ListarReservaciones> {
  late List ServiciosData = [];
  late List ServiciosH = [];
  late List ServiciosV = [];
  late List ServiciosT = [];
  late List ServiciosR = [];
  var idUser = barra.idUser;

  //obtenemos los datos de la api
  getReservas() async {
    var tipo = barra.tipo;

    //para telefono
    // var urlH = Uri.parse('http://10.0.2.2:4000/reservas/hotelN');

    // para web
    var urlH = Uri.parse('http://localhost:4000/reservas/hotelN');
    var urlV = Uri.parse('http://localhost:4000/reservas/viajeN');
    var urlT = Uri.parse('http://localhost:4000/reservas/tourN');
    var urlR = Uri.parse('http://localhost:4000/reservas/restauranteN');
    var responseH = await http.post(urlH, body: {'id': '$idUser','tipo': '$tipo'});
    var responseV = await http.post(urlV, body: {'id': '$idUser','tipo': '$tipo'});
    var responseT = await http.post(urlT, body: {'id': '$idUser','tipo': '$tipo'});
    var responseR = await http.post(urlR, body: {'id': '$idUser','tipo': '$tipo'});

    if(json.decode(responseH.body)['row'].toString() != 'null'){
      ServiciosH = List<Map<String, dynamic>>.from(json.decode(responseH.body)['row']);
    }
    if(json.decode(responseV.body)['row'].toString() != 'null'){
      ServiciosV = List<Map<String, dynamic>>.from(json.decode(responseV.body)['row']);
    }
    if(json.decode(responseT.body)['row'].toString() != 'null'){
      ServiciosT = List<Map<String, dynamic>>.from(json.decode(responseT.body)['row']);
    }
    if(json.decode(responseR.body)['row'].toString() != 'null'){
      ServiciosR = List<Map<String, dynamic>>.from(json.decode(responseR.body)['row']);
    }

    setState(() {
      ServiciosData.addAll(ServiciosH);
      ServiciosData.addAll(ServiciosV);
      ServiciosData.addAll(ServiciosT);
      ServiciosData.addAll(ServiciosR);
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
                "Reservas",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ServiciosData.isEmpty ? DataTableNull() :  DataTableWithData(),
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
          label: Text('Nombre'),
        ),
        DataColumn(
          label: Text('Fecha Entrada'),
        ),
        DataColumn(
          label: Text('Fecha Salida'),
        ),
        DataColumn(
          label: Text('Acciones'),
        ),
      ],
      rows: List<DataRow>.generate(
        ServiciosData == null ? 0 : ServiciosData.length,
            (int index) => DataRow(
          cells: <DataCell>[
            DataCell(Text(ServiciosData[index]["Nombre"].toString())),
            DataCell(Text(ServiciosData[index]["FechaEntrada"].toString())),
            DataCell(Text(ServiciosData[index]["FechaSalida"].toString())),
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
                      onPressed: (){eliminar(index);},
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

  eliminar(index) async{
    var id = ServiciosData[index]["idReserva"];
    var url = Uri.parse('http://localhost:4000/reservas/eliminar');
    var responseH = await http.post(url, body: {'id': '$id'});

    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Reserva eliminada", style: Theme.of(context).textTheme.headline6),
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