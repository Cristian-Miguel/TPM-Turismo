import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Reservas extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Reservas();
  }
}

class _Reservas extends State<Reservas>{

  late List ReservasData = [];

  //obtenemos los datos de la api
  getReservas() async{
    //para telefonos
    // var url = Uri.parse('http://10.0.2.2:4000/api/favoritos/listar');
    // para web
    var url = Uri.parse('http://localhost:4000/api/favoritos/listar');
    var response = await http.get(url);

    setState(() {
      ReservasData = List<Map<String, dynamic>>.from(json.decode(response.body)['rows']);
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
          height: Theme.of(context).textTheme.bodyText1!.fontSize! * 4.5,
          width: 500,
          color: Colors.white,
          padding: const EdgeInsets.only(left:16, top: 16),
          child: const Text(
            "Reservaciones",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child:ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: ReservasData == null ? 0 : ReservasData.length,
              itemBuilder: (BuildContext context, int index){
                return RaisedButton(
                  color: Colors.white,
                  onPressed: _onChangeReserva,
                  child: Container(
                    height: Theme.of(context).textTheme.bodyText1!.fontSize! * 10.5,
                    margin: const EdgeInsets.only(left:0) ,
                    child: Row(
                      children: <Widget> [
                        Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(
                              color: Colors.yellow, //PARA PROBAR CONTAINER
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  "https://th.bing.com/th/id/OIP.a5I79QCQTC4Zs2grN163lgHaHa?pid=ImgDet&rs=1",
                                ),
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
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget> [
                                Container(
                                  margin: const EdgeInsets.only(left:16),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget> [
                                        Container(
                                          child: const Text(
                                            "Conociendo Morelia",
                                            style: TextStyle(
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),

                                        Row(
                                            children: <Widget> [
                                              Container(
                                                margin: const EdgeInsets.only(bottom: 5) ,
                                                child: const Icon(
                                                  Icons.star,
                                                  color: Colors.pinkAccent,
                                                  size: 15,
                                                ),
                                              ),
                                              Container(
                                                  margin: const EdgeInsets.only(left:5, bottom: 5, top: 2) ,
                                                  child: const Text(
                                                    "4.71 (300)",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                  )
                                              ),
                                            ]
                                        ),

                                        Container(
                                            margin: const EdgeInsets.only(bottom: 2),
                                            child: const Text(
                                                "Disfrute de la magia de Patzcuaro, verdaderamente el \"secreto mejor guardado\" de todas las ciudades coloniales de Mexico.",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.black54
                                                ),
                                            )

                                        ),

                                        Container(
                                          child: const Text(
                                            "08/03/2022",
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),

                                        Container(
                                          child: const Text(
                                            "\$352 MXN p/p",
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ]
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
          ),
        ),

      ],

    );
  }

  void _onChangeReserva(){
    Navigator.of(context).push(
        MaterialPageRoute(
            builder:(context){
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Reserva'),
                  ),
                  body: const Center(
                    child: Text('Pagina de Reservas'),
                  ),
              );
            }
        )
    );
  }
}