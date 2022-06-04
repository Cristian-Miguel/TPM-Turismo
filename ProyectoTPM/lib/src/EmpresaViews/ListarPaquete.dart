import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'AgregarPaquete.dart';

class ListarPaquetes extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _ListarPaquetes();
  }
}

class _ListarPaquetes extends State<ListarPaquetes> {

  late List ServiciosData = [];
  late List ServiciosP = [];

  //obtenemos los datos de la api
  getReservas() async {

    //para telefono
    // var url = Uri.parse('http://10.0.2.2:4000/servicios/Paquetes');

    // para web
    var url = Uri.parse('http://localhost:4000/servicios/Paquetes');
    var response = await http.get(url);

    if(json.decode(response.body)['row'].toString() != 'null'){
      ServiciosP = List<Map<String, dynamic>>.from(json.decode(response.body)['row']);
    }

    setState(() {
      ServiciosData.addAll(ServiciosP);
      print(ServiciosData.toString());
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
                "Paquetes",
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
              DataCell(Text(ServiciosData[index]["idPaquete"].toString())),
              DataCell(Text(ServiciosData[index]["Nombre"].toString())),
              DataCell(
                  Row(
                    children: <Widget>[
                      IconButton(
                        alignment: Alignment.centerLeft,
                        onPressed: (){InfoPaquete(index);},
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
                    title: const Text('Agregar Paquete', style: TextStyle(color: Colors.black),),
                    backgroundColor: Colors.white,
                    //centerTitle: true,
                    iconTheme: const IconThemeData(color: Colors.black)
                ),
                body:AgregarPaquete(),
              );
            }
        )
    );
  }

  InfoPaquete(index){
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
                          "Informacion del Paquetes",
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
                            ServiciosData[index]["idPaquete"].toString(),
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
                          "Numero de Paquetes:",
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
                            ServiciosData[index]["NumeroPaquetes"].toString(),
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