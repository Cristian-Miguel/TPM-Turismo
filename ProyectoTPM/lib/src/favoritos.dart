import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Favoritos extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Favoritos();
  }
}

class _Favoritos extends State<Favoritos>{
  // late Map data;
  late List FavoritosData = [];
  late List FavoritosH = [];
  late List FavoritosV = [];
  late List FavoritosR = [];
  late List FavoritosT = [];
  late List FavoritosP = [];

  //obtenemos los datos de la api
  getFavoritos() async{
    //para telefonos
    var urlH = Uri.parse('http://10.0.2.2:4000/favoritos/Hoteles');
    var urlV = Uri.parse('http://10.0.2.2:4000/favoritos/Viajes');
    var urlR = Uri.parse('http://10.0.2.2:4000/favoritos/Restaurantes');
    var urlT = Uri.parse('http://10.0.2.2:4000/favoritos/Tour');
    var urlP = Uri.parse('http://10.0.2.2:4000/favoritos/Paquete');

    // para web
    // var urlH = Uri.parse('http:/localhost:4000/favoritos/Hoteles');
    // var urlV = Uri.parse('http://localhost:4000/favoritos/Viajes');
    // var urlR = Uri.parse('http://localhost:4000/favoritos/Restaurantes');
    // var urlT = Uri.parse('http://localhost:4000/favoritos/Tour');
    // var urlP = Uri.parse('http://localhost:4000/favoritos/Paquetes');
    var responseH = await http.get(urlH);
    var responseV = await http.get(urlV);
    var responseR = await http.get(urlR);
    var responseT = await http.get(urlT);
    var responseP = await http.get(urlP);

    if(json.decode(responseH.body)['row'].toString() != 'null'){
      FavoritosH = List<Map<String, dynamic>>.from(json.decode(responseH.body)['row']);
    }
    if(json.decode(responseV.body)['row'].toString() != 'null'){
      FavoritosV = List<Map<String, dynamic>>.from(json.decode(responseV.body)['row']);
    }
    if(json.decode(responseR.body)['row'].toString() != 'null'){
      FavoritosR = List<Map<String, dynamic>>.from(json.decode(responseR.body)['row']);
    }
    if(json.decode(responseT.body)['row'].toString() != 'null'){
      FavoritosT = List<Map<String, dynamic>>.from(json.decode(responseT.body)['row']);
    }
    if(json.decode(responseP.body)['row'].toString() != 'null'){
      FavoritosP = List<Map<String, dynamic>>.from(json.decode(responseP.body)['row']);
    }

    setState(() {
      // FavoritosData = List<Map<String, dynamic>>.from(json.decode(responseH.body)['hoteles']);
        FavoritosData.addAll(FavoritosH);
        FavoritosData.addAll(FavoritosV);
        FavoritosData.addAll(FavoritosR);
        FavoritosData.addAll(FavoritosT);
        FavoritosData.addAll(FavoritosP);

    });
  }
  //constructor tara inicializar el getFavoritos
  @override
  void initState() {
    super.initState();
    getFavoritos();
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
              "Favoritos",
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
               itemCount: FavoritosData == null ? 0 : FavoritosData.length,
               itemBuilder: (BuildContext context, int index){
                 return RaisedButton(
                   color: Colors.white,
                   onPressed: _onChangeFavorito,
                   child: Container(
                     height: Theme.of(context).textTheme.bodyText1!.fontSize! * 10.5,
                     margin: const EdgeInsets.only(left:0) ,
                     child: Row(
                       children: <Widget> [
                         Container(
                           height: 125,
                           width: 125,
                           decoration: BoxDecoration(
                               color: Colors.yellow,  //PARA PROBAR CONTAINER
                               borderRadius: BorderRadius.circular(10.0),
                               image: DecorationImage(
                                 image: NetworkImage("${FavoritosData[index]["Imagen"].toString()}"),
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
                             child: Container(
                               margin: const EdgeInsets.only(left:16),
                               child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: <Widget> [
                                     Container(
                                       child: Text(
                                         "${FavoritosData[index]["Nombre"].toString()}",
                                         style: const TextStyle(
                                           fontSize: 22,
                                         ),
                                       ),
                                     ),
                                     Container(
                                       child: Text(
                                         "${FavoritosData[index]["Descripcion"].toString()}",
                                         style:const  TextStyle(
                                           fontSize: 11,
                                           color: Colors.black54
                                         ),
                                       ),
                                     ),
                                   ]
                               ),
                             ),
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
  void _onChangeFavorito(){
    Navigator.of(context).push(
        MaterialPageRoute(
            builder:(context){
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Favorito'),
                ),
                body: const Center(
                  child: Text('Pagina de Favorito'),
                ),
              );
            }
        )
    );
  }

}
