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
    var url = Uri.parse('http://10.0.2.2:4000/api/favoritos/listar');
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
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: FavoritosData == null ? 0 : FavoritosData.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            child: Row(
              children: <Widget> [
                Text("${FavoritosData[index]["idApoyo"].toString()}.- "),
                Text("${FavoritosData[index]["Descripcion"].toString()}"),
              ],
            ),
          );
        }
    );
  }

}




// ListView.builder(
// scrollDirection: Axis.vertical,
// shrinkWrap: true,
// itemCount: FavoritosData == null ? 0 : FavoritosData.length,
// itemBuilder: (BuildContext context, int index){
// return Card(
// child: Row(
// children: <Widget> [
// Container(
// height: Theme.of(context).textTheme.bodyText1!.fontSize! * 1.5,
// width: 200,
// child:Text("${FavoritosData[0]["Descripcion"].toString()}"),
// )
// ],
// ),
// );
// },
// ),

// Column(
// children: [
// Row(
// children: <Widget>[
// Container(
// height: Theme.of(context).textTheme.bodyText1!.fontSize! * 2.5,
// width: 200,
// // color: Colors.green,
// margin: const EdgeInsets.only(left: 16, top: 16),
// child: const Text(
// "Favoritos",
// style: TextStyle(
// fontSize: 24,
// ),
// ),
// ),
// ]
// ),
// Row(
// mainAxisSize: MainAxisSize.min,
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children:<Widget>[
// Expanded(
// child: Container(
//
// )
// ),
// ]
// )
// ]
// );