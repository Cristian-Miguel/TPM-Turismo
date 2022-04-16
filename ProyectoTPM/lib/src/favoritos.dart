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

  //obtenemos los datos de la api
  getFavoritos() async{
    //para telefonos
    var url = Uri.parse('http://10.0.2.2:4000/api/favoritos/listar');
    // para web
    // var url = Uri.parse('http://localhost:4000/api/favoritos/listar');
    var response = await http.get(url);
    // debugPrint(response.body);
    // var data = json.decode(response.body);
    // debugPrint();
    setState(() {
      FavoritosData = List<Map<String, dynamic>>.from(json.decode(response.body)['rows']);
      // debugPrint(FavoritosData[0]["Descripcion"].toString());
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
           // margin: const EdgeInsets.only(left:16, top: 16),
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
                   onPressed: ()  {
                     print("Hola Raised Button");
                   },
                   child: Container(
                     height: Theme.of(context).textTheme.bodyText1!.fontSize! * 10.5,
                     margin: const EdgeInsets.only(left:0) ,
                     child: Row(
                       children: <Widget> [
                         Container(
                           height: 125,
                           width: 125,
                           // color: Colors.white,
                           // margin: const EdgeInsets.only(left:2, top: 16),
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
                         Container(
                           margin: const EdgeInsets.only(left:16),
                           child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget> [
                                 Container(
                                   // height: Theme.of(context).textTheme.bodyText1!.fontSize! * 2.5,
                                   // width: 100,
                                   // color: Colors.green,
                                   // margin: const EdgeInsets.only(left:2, top: 18),
                                   child: const Text(
                                     "Conociendo Morelia",
                                     // "${FavoritosData[index]["idApoyo"].toString()}.- ",
                                     style: TextStyle(
                                       fontSize: 22,
                                     ),
                                   ),
                                 ),
                                 Container(
                                   // height: Theme.of(context).textTheme.bodyText1!.fontSize! * 2.5,
                                   // width: 200,
                                   // color: Colors.green,
                                   // margin: const EdgeInsets.only(left:16, top: 16),
                                   child: const Text(
                                     "Disfrute de la magia de Patzcuaro,\n verdaderamente el \"secreto mejor\n guardado\" de todas las ciudades\n coloniales de Mexico",
                                     // "${FavoritosData[index]["Descripcion"].toString()}",
                                     style: TextStyle(
                                       fontSize: 12,
                                     ),
                                   ),
                                 ),
                               ]
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

}