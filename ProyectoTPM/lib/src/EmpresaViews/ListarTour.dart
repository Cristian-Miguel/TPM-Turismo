import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyectotmp/src/EmpresaViews/AgregarTour.dart';
import 'package:proyectotmp/barra_inferior/barrainf.dart' as barra;

class ListarTours extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ListarTours();
  }
}

class _ListarTours extends State<ListarTours> {

  late List ServiciosData = [];
  late List ServiciosT = [];
  var idUser = barra.idUser;

  //obtenemos los datos de la api
  getReservas() async {
    var tipo = barra.tipo;

    //para telefono
    // var url = Uri.parse('http://10.0.2.2:4000/empresa/Tour');;

    // para web
    var url = Uri.parse('http://localhost:4000/empresa/Tour');
    var response = await http.post(url, body: {'id': '$idUser','tipo': '$tipo'});

    if(json.decode(response.body)['row'].toString() != 'null'){
      ServiciosT = List<Map<String, dynamic>>.from(json.decode(response.body)['row']);
    }

    setState(() {
      ServiciosData.addAll(ServiciosT);
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
                "Tours",
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
            DataCell(Text(ServiciosData[index]["idTour"].toString())),
            DataCell(Text(ServiciosData[index]["Nombre"].toString())),
            DataCell(
                Row(
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.centerLeft,
                      onPressed: (){InfoTour(index);},
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
                    title: const Text('Agregar Tour', style: TextStyle(color: Colors.black),),
                    backgroundColor: Colors.white,
                    //centerTitle: true,
                    iconTheme: const IconThemeData(color: Colors.black)
                ),
                body:AgregarTours(),
              );
            }
        )
    );
  }

  InfoTour(index){
    Navigator.of(context).push(
        MaterialPageRoute(
            builder:(context)
            {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Reservar', style: TextStyle(color: Colors.black),),
                  backgroundColor: Colors.white,
                  iconTheme: const IconThemeData(color: Colors.black),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[

                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left:16, right: 16, top: 25),
                        child: const Text(
                          "Informacion del Hotel ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ),

                      const Divider(
                        color: Colors.black38,
                      ),

                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left:16, right: 16, top: 20),
                        child: const Text(
                          "Id: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      SizedBox(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(left:16, right: 16, top: 5),
                          child: Text(
                            ServiciosData[index]["idTour"].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(left:16, right: 16, top: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Nombre: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      SizedBox(
                        child: Container(
                          margin: const EdgeInsets.only(left:16, right: 16, top: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ServiciosData[index]["Nombre"].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(left:16, right: 16, top: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Descripcion: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      SizedBox(
                        child: Container(
                          margin: const EdgeInsets.only(left:16, right: 16, top: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ServiciosData[index]["Descripcion"].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(left:16, right: 10, top: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Imagen: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(left:16, right:16, top: 5),
                        height: 175,
                        width: 175,
                        decoration: BoxDecoration(
                            color: Colors.yellow,  //PARA PROBAR CONTAINER
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage("${ServiciosData[index]["Imagen"].toString()}"),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: const[
                              BoxShadow(
                                //SOMBRA
                                color: Color(0xffA4A4A4),
                                offset: Offset(1.0, 5.0),
                                blurRadius: 3.0,
                              ),
                            ]
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(left:16, right: 16, top: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                            "Cantidad de personas: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )
                        ),
                      ),

                      SizedBox(
                        child:Container(
                          margin: const EdgeInsets.only(left:16, right: 16, top: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ServiciosData[index]["Cantidad"].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(left:16, right: 16, top: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Costo: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      SizedBox(
                        child:Container(
                          margin: const EdgeInsets.only(left:16, right: 16, top: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "\$"+ServiciosData[index]["Costo"].toString()+".00",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(left:16, right: 16, top: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Ciudad:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      SizedBox(
                        child:Container(
                          margin: const EdgeInsets.only(left:16, right: 16, top: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ServiciosData[index]["Ciudad"].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(left:16, right: 16, top: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Descuento:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      SizedBox(
                        child:Container(
                          margin: const EdgeInsets.only(left:16, right: 16, top: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "\$"+ServiciosData[index]["Descuento"].toString()+".00",
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(left:16, right: 16, top: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Calificacion:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      SizedBox(
                        child:Container(
                          margin: const EdgeInsets.only(left:16, right: 16, top: 5, bottom: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ServiciosData[index]["Calificacion"].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              );
            }
        )
    );
  }

}