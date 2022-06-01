import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Descubrir extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return _Descubrir();
  }
}

class _Descubrir extends State<Descubrir>{

  late List ServiciosData = [];
  late List ServiciosH = [];
  late List ServiciosV = [];
  late List ServiciosR = [];
  late List ServiciosT = [];
  late List ServiciosP = [];

  //obtenemos los datos de la api
  getReservas() async {
    //para telefono
    // var urlH = Uri.parse('http://10.0.2.2:4000/servicios/Hoteles');
    // var urlV = Uri.parse('http://10.0.2.2:4000/servicios/Viajes');
    // var urlR = Uri.parse('http://10.0.2.2:4000/servicios/Restaurantes');
    // var urlT = Uri.parse('http://10.0.2.2:4000/servicios/Tour');
    // var urlP = Uri.parse('http://10.0.2.2:4000/servicios/Paquetes');

    // para web
    var urlH = Uri.parse('http://localhost:4000/servicios/Hoteles');
    var urlV = Uri.parse('http://localhost:4000/servicios/Viajes');
    var urlR = Uri.parse('http://localhost:4000/servicios/Restaurantes');
    var urlT = Uri.parse('http://localhost:4000/servicios/Tour');
    var urlP = Uri.parse('http://localhost:4000/servicios/Paquetes');

    var responseH = await http.get(urlH);
    var responseV = await http.get(urlV);
    var responseR = await http.get(urlR);
    var responseT = await http.get(urlT);
    var responseP = await http.get(urlP);

    if(json.decode(responseH.body)['row'].toString() != 'null'){
      ServiciosH = List<Map<String, dynamic>>.from(json.decode(responseH.body)['row']);
    }
    if(json.decode(responseV.body)['row'].toString() != 'null'){
      ServiciosV = List<Map<String, dynamic>>.from(json.decode(responseV.body)['row']);
    }
    if(json.decode(responseR.body)['row'].toString() != 'null'){
      ServiciosR = List<Map<String, dynamic>>.from(json.decode(responseR.body)['row']);
    }
    if(json.decode(responseT.body)['row'].toString() != 'null'){
      ServiciosT = List<Map<String, dynamic>>.from(json.decode(responseT.body)['row']);
    }
    if(json.decode(responseP.body)['row'].toString() != 'null'){
      ServiciosP = List<Map<String, dynamic>>.from(json.decode(responseP.body)['row']);
    }

    setState(() {
      ServiciosData.addAll(ServiciosH);
      ServiciosData.addAll(ServiciosV);
      ServiciosData.addAll(ServiciosR);
      ServiciosData.addAll(ServiciosT);
      ServiciosData.addAll(ServiciosP);
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
    return Column(
      children: <Widget>[
        Container(
          height: Theme
              .of(context)
              .textTheme
              .bodyText1!
              .fontSize! * 4.5,
          width: 500,
          color: Colors.white,
          padding: const EdgeInsets.only(left: 16, top: 16),
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: ServiciosData == null ? 0 : ServiciosData.length,
            itemBuilder: (ctx, i) {
              return Container(
                margin: EdgeInsets.all(5),
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: (){  },
                  // child: Card(
                child: Container(
                  height: 290,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.network(
                              '${ServiciosData[i]["Imagen"].toString()}',
                               fit: BoxFit.fill,
                          ),
                        ),
                         Text(
                          '${ServiciosData[i]["Nombre"].toString()}',
                          style: const TextStyle(
                          fontSize: 16,
                          //fontWeight: FontWeight.bold,
                          ),
                        ),
                         Row(
                             children: <Widget>[
                               Container(
                                 margin: const EdgeInsets.only(
                                     bottom: 5, top: 4),
                                 child: const Icon(
                                   Icons.star,
                                   color: Colors.pinkAccent,
                                   size: 10,
                                 ),
                               ),
                               Container(
                                   margin: const EdgeInsets.only(
                                       left: 5,
                                       bottom:5,
                                       top: 4),
                                   child: Text(
                                     "${ServiciosData[i]["Calificacion"].toString()}",
                                     style: const TextStyle(
                                       fontSize: 10,
                                     ),
                                   )
                               ),
                             ]
                          ),
                          Row(
                            children:  [
                              Text(
                                'Desde ${ServiciosData[i]["Costo"].toString()} MXM p/p',
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
               ),
              );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 5,
            mainAxisExtent: 264,
          ),
          ),
        ),
      ],
    );
  }



}