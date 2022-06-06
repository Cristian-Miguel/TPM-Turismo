import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:proyectotmp/barra_inferior/barrainf.dart' as barra;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Reservas extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Reservas();
  }
}

class _Reservas extends State<Reservas> {

  final _folioInputTextController =  TextEditingController();
  var idUsuario = barra.idUser;
  var tipoUsuario = barra.tipo;

  late List ReservasData = [];
  late List ReservasH = [];
  late List ReservasV = [];
  late List ReservasR = [];
  late List ReservasT = [];
  late List ReservasP = [];

  int activeIndex= 0;

  //obtenemos los datos de la api
  getReservas() async {
    //para telefono
    // var urlH = Uri.parse('http://10.0.2.2:4000/reservas/Hoteles');
    // var urlV = Uri.parse('http://10.0.2.2:4000/reservas/Viajes');
    // var urlR = Uri.parse('http://10.0.2.2:4000/reservas/Restaurantes');
    // var urlT = Uri.parse('http://10.0.2.2:4000/reservas/Tour');
    // var urlP = Uri.parse('http://10.0.2.2:4000/reservas/Paquetes');

    // para web
    var urlH = Uri.parse('http://localhost:4000/reservas/Hoteles');
    var urlV = Uri.parse('http://localhost:4000/reservas/Viajes');
    var urlR = Uri.parse('http://localhost:4000/reservas/Restaurantes');
    var urlT = Uri.parse('http://localhost:4000/reservas/Tour');
    var urlP = Uri.parse('http://localhost:4000/reservas/Paquetes');

    var responseH = await http.post(urlH, body: {'id': '$idUsuario'});
    var responseV = await http.post(urlV, body: {'id': '$idUsuario'});
    var responseR = await http.post(urlR, body: {'id': '$idUsuario'});
    var responseT = await http.post(urlT, body: {'id': '$idUsuario'});
    var responseP = await http.post(urlP, body: {'id': '$idUsuario'});

    if(json.decode(responseH.body)['row'].toString() != 'null'){
      ReservasH = List<Map<String, dynamic>>.from(json.decode(responseH.body)['row']);
    }
    if(json.decode(responseV.body)['row'].toString() != 'null'){
      ReservasV = List<Map<String, dynamic>>.from(json.decode(responseV.body)['row']);
    }
    if(json.decode(responseR.body)['row'].toString() != 'null'){
      ReservasR = List<Map<String, dynamic>>.from(json.decode(responseR.body)['row']);
    }
    if(json.decode(responseT.body)['row'].toString() != 'null'){
      ReservasT = List<Map<String, dynamic>>.from(json.decode(responseT.body)['row']);
    }
    if(json.decode(responseP.body)['row'].toString() != 'null'){
      ReservasP = List<Map<String, dynamic>>.from(json.decode(responseP.body)['row']);
    }


    setState(() {
      // ReservasData = List<Map<String, dynamic>>.from(json.decode(responseH.body)['row']);
      ReservasData.addAll(ReservasH);
      ReservasData.addAll(ReservasV);
      ReservasData.addAll(ReservasR);
      ReservasData.addAll(ReservasT);
      ReservasData.addAll(ReservasP);
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
    if(tipoUsuario ==  "Empresa"){
      if(ReservasData.isEmpty) return sinReservaciones();
      else return viewEmpresa();
    }
    else if(tipoUsuario ==  "Usuario"){
      if(ReservasData.isEmpty) return sinReservaciones();
      return viewUsuario();
    }
    else{
      return viewInvitado();
    }
  }

  late List user = [];
  var nombre = "";
  var apellidoP = "";

  Center sinReservaciones(){
    return Center(
      child: Text("No ha hecho ninguna reservacion aún :("),
    );
  }

  viewEmpresa(){
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
          child: const Text(
            "Reservaciones",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: ReservasData == null ? 0 : ReservasData.length,
              itemBuilder: (BuildContext context, int index) {
                return RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    if(ReservasData[index]["idHotel"] != null) _onChangeReserva(index,"idHotel");
                    if(ReservasData[index]["idViaje"] != null) _onChangeReserva(index,"idViaje");
                    if(ReservasData[index]["idRestaurante"] != null) _onChangeReserva(index,"idRestaurante");
                    if(ReservasData[index]["idTour"] != null) _onChangeReserva(index,"idTour");
                    if(ReservasData[index]["idPaquete"] != null) _onChangeReserva(index,"idPaquete");
                  },
                  child: Container(
                    height: Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .fontSize! * 10.5,
                    margin: const EdgeInsets.only(left: 0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(
                              color: Colors.yellow, //PARA PROBAR CONTAINER
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                  "${ReservasData[index]["Imagen"].toString()}",
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
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(left: 16),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            // "Conociendo Morelia",
                                            "${ReservasData[index]["Nombre"].toString()}",
                                            style: const TextStyle(
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),

                                        Row(
                                            children: <Widget>[
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: const Icon(
                                                  Icons.star,
                                                  color: Colors.pinkAccent,
                                                  size: 15,
                                                ),
                                              ),
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 5,
                                                      bottom: 5,
                                                      top: 2),
                                                  child: Text(
                                                    "${ReservasData[index]["Calificacion"].toString()} (300)",
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                  )
                                              ),
                                            ]
                                        ),

                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 2),
                                            child:  Text(
                                              // "Disfrute de la magia de Patzcuaro, verdaderamente el \"secreto mejor guardado\" de todas las ciudades coloniales de Mexico.",
                                              "${ReservasData[index]["Descripcion"].toString()}",
                                              textAlign: TextAlign.start,
                                              style:const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black54
                                              ),
                                            )

                                        ),

                                        Container(
                                          child:  Text(
                                            // "08/03/2022",
                                            "${ReservasData[index]["FechaEntrada"].toString()[8]+ReservasData[index]["FechaEntrada"].toString()[9]}/"+
                                                "${ReservasData[index]["FechaEntrada"].toString()[5]+ReservasData[index]["FechaEntrada"].toString()[6]}/"+
                                                "${ReservasData[index]["FechaEntrada"].toString()[0]+ReservasData[index]["FechaEntrada"].toString()[1]+
                                                    ReservasData[index]["FechaEntrada"].toString()[2]+ReservasData[index]["FechaEntrada"].toString()[3]}",
                                            style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),

                                        Container(
                                          child:  Text(
                                            "\$${ReservasData[index]["Costo"].toString()} MXN p/p",
                                            style: const TextStyle(
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

  viewUsuario(){
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
          child: const Text(
            "Reservaciones",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: ReservasData == null ? 0 : ReservasData.length,
              itemBuilder: (BuildContext context, int index) {
                return RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    if(ReservasData[index]["idHotel"] != null) _onChangeReserva(index,"idHotel");
                    if(ReservasData[index]["idViaje"] != null) _onChangeReserva(index,"idViaje");
                    if(ReservasData[index]["idRestaurante"] != null) _onChangeReserva(index,"idRestaurante");
                    if(ReservasData[index]["idTour"] != null) _onChangeReserva(index,"idTour");
                    if(ReservasData[index]["idPaquete"] != null) _onChangeReserva(index,"idPaquete");
                  },
                  child: Container(
                    height: Theme
                        .of(context)
                        .textTheme
                        .bodyText1!
                        .fontSize! * 10.5,
                    margin: const EdgeInsets.only(left: 0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(
                              color: Colors.yellow, //PARA PROBAR CONTAINER
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                  "${ReservasData[index]["Imagen"].toString()}",
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
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(left: 16),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            // "Conociendo Morelia",
                                            "${ReservasData[index]["Nombre"].toString()}",
                                            style: const TextStyle(
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),

                                        Row(
                                            children: <Widget>[
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: const Icon(
                                                  Icons.star,
                                                  color: Colors.pinkAccent,
                                                  size: 15,
                                                ),
                                              ),
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 5,
                                                      bottom: 5,
                                                      top: 2),
                                                  child: Text(
                                                    "${ReservasData[index]["Calificacion"].toString()} (300)",
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                  )
                                              ),
                                            ]
                                        ),

                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 2),
                                            child:  Text(
                                              // "Disfrute de la magia de Patzcuaro, verdaderamente el \"secreto mejor guardado\" de todas las ciudades coloniales de Mexico.",
                                              "${ReservasData[index]["Descripcion"].toString()}",
                                              textAlign: TextAlign.start,
                                              style:const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black54
                                              ),
                                            )

                                        ),

                                        Container(
                                          child:  Text(
                                            // "08/03/2022",
                                            "${ReservasData[index]["FechaEntrada"].toString()[8]+ReservasData[index]["FechaEntrada"].toString()[9]}/"+
                                                "${ReservasData[index]["FechaEntrada"].toString()[5]+ReservasData[index]["FechaEntrada"].toString()[6]}/"+
                                                "${ReservasData[index]["FechaEntrada"].toString()[0]+ReservasData[index]["FechaEntrada"].toString()[1]+
                                                    ReservasData[index]["FechaEntrada"].toString()[2]+ReservasData[index]["FechaEntrada"].toString()[3]}",
                                            style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),

                                        Container(
                                          child:  Text(
                                            "\$${ReservasData[index]["Costo"].toString()} MXN p/p",
                                            // "\$352 MXN p/p",
                                            style: const TextStyle(
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

  viewInvitado(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
            child: const Text(
              "Encuentre su reservacion",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 13, right: 13),
            margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(93, 93, 93, 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              controller: _folioInputTextController,
              decoration: const InputDecoration(
                hintText: '...Ingrese el folio...',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            width: Theme.of(context).textTheme.bodyText1!.fontSize! * 24,
            margin: const EdgeInsets.only(left:6, right: 0, top: 10, bottom: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                primary: Colors.pinkAccent,
                onPrimary: Colors.white,
                // side: BorderSide(color: Colors.red, width: 1),
              ),
              onPressed: (){
                setState(() {
                  var folio = _folioInputTextController.value.text;
                  searchFolio( folio );
                });
              },
              child: const Text(
                'Buscar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  searchFolio( id ) async {
    //para telefono
    // var url = Uri.parse('http://10.0.2.2:4000/reservas/Folio');
    print("-------->"+id.toString());
    // para web
    var url = Uri.parse('http://localhost:4000/reservas/Folio');

    var response = await http.post(url, body: {'id': '$id'});

    if(json.decode(response.body)['row'].toString() != 'null'){
      ReservasH = List<Map<String, dynamic>>.from(json.decode(response.body)['row']);
    }

    setState(() {
      ReservasData.addAll(ReservasH);
      if(ReservasData[0]["idHotel"] != null)       _onChangeReserva(0,"idHotel");
      if(ReservasData[0]["idViaje"] != null)       _onChangeReserva(0,"idViaje");
      if(ReservasData[0]["idRestaurante"] != null) _onChangeReserva(0,"idRestaurante");
      if(ReservasData[0]["idTour"] != null)        _onChangeReserva(0,"idTour");
      if(ReservasData[0]["idPaquete"] != null)     _onChangeReserva(0,"idPaquete");
      // _onChangeReserva( ReservasData[0]['id'], ReservasData[0]['id']);
    });
  }

  void getUserInfo(index,tipo) async{
    var id = 0;
    var columna = "";
    var tabla = "";

    if(tipo == "idHotel"){
      id = ReservasData[index]["idHotel"];
      columna = "idHotel";
      tabla = "hotel";
    }
    if(tipo == "idViaje"){
      id = ReservasData[index]["idViaje"];
      columna = "idViaje";
      tabla = "viajes";
    }
    if(tipo == "idRestaurante"){
      id = ReservasData[index]["idRestaurante"];
      columna = "idRestaurante";
      tabla = "restaurantes";
    }
    if(tipo == "idTour"){
      id = ReservasData[index]["idTour"];
      columna = "idTour";
      tabla = "tour";
    }
    if(tipo == "idPaquete"){
      id = ReservasData[index]["idPaquete"];
      columna = "idPaquete";
      tabla = "paquetes";
    }

    var response = await http.post(Uri.parse("http://localhost:4000/Usuarios/Nombre/"), body: {'id': '$id', 'columna': '$columna', 'tabla': '$tabla'});
    if(json.decode(response.body)['row'].toString() != 'null'){
      user = List<Map<String, dynamic>>.from(json.decode(response.body)['row']);
    }

    setState(() {
      nombre = user.first["Nombre"];
      apellidoP = user.first["ApellidoPaterno"];
    });
  }

  void _onChangeReserva(index,tipo){
    getUserInfo(index,tipo);
    var calificacion = ReservasData[index]["Calificacion"];
    var descripcion = ReservasData[index]["Descripcion"];
    var costo = ReservasData[index]["Costo"];
    print(ReservasData[index].toString());

    Future.delayed(Duration(milliseconds: 100), () {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) {
              final CarouselController _controller = CarouselController();
              final List<String>  images = [
                ReservasData[index]["Imagen"],
                ReservasData[index]["Imagen"],
                ReservasData[index]["Imagen"],
                ReservasData[index]["Imagen"],
                ReservasData[index]["Imagen"],
              ];

              final List<String> descripimages = [
                ReservasData[index]["Imagen"],
                ReservasData[index]["Imagen"],
                ReservasData[index]["Imagen"],
                ReservasData[index]["Imagen"],
              ];

              return Scaffold(
                appBar: AppBar(
                    title: const Text('Reserva', style: TextStyle(color: Colors.black),),
                    backgroundColor: Colors.white,
                    //centerTitle: true,
                    iconTheme: const IconThemeData(color: Colors.black)
                ),
                body: Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                            height: 390,
                            viewportFraction: 1,
                            autoPlay: true,
                            onPageChanged: (index, reason) =>
                              setState(()=> activeIndex = index),
                         ),
                        itemCount: images.length,
                        itemBuilder: (context, index, realindex) {
                          final image = images[index];
                          return buildImage(image, index);
                        },
                      ),
                      const SizedBox(height: 10,),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(left: 16, right: 16),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          ReservasData[index]["Nombre"],
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      Row(
                                          children: <Widget>[
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: const Icon(
                                                Icons.star,
                                                color: Colors.pinkAccent,
                                                size: 15,
                                              ),
                                            ),
                                            Container(
                                                margin: const EdgeInsets.only(
                                                    left: 5,
                                                    bottom: 5,
                                                    top: 2),
                                                child: Text(
                                                  "$calificacion",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                )
                                            ),
                                          ]
                                      ),

                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 2),
                                              child: Text(
                                                "Experiencia ofrecida \n"
                                                    "por $nombre $apellidoP",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              )
                                          ),
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    "https://th.bing.com/th/id/OIP.DqQp2MTPz9G8kcWeHoAj8gHaIv?pid=ImgDet&rs=1",
                                                  ),
                                                  alignment: Alignment.topRight,
                                                  fit: BoxFit.fill,
                                                ),
                                            ),
                                          ),
                                        ]
                                    ),

                                      Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 10,
                                            ),
                                        child: Text(
                                          "Costo: $costo",
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        child: const Divider(
                                          color: Colors.black54,
                                          thickness: 1,
                                        ),
                                      ),

                                      Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 5,
                                            top: 5),
                                        child: const Text(
                                          "¿Qué harás?",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        child: Text(
                                          "$descripcion",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),

                                     Padding(
                                        padding: const EdgeInsets.all(8.0),

                                        child: GridView.builder(
                                            itemCount: descripimages.length,
                                            itemBuilder: (BuildContext ctx, index) {
                                              return Image.network(descripimages[index], fit: BoxFit.cover);
                                            },
                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 10,
                                                crossAxisSpacing: 10
                                            ),
                                            //padding: const EdgeInsets.all( left: 16, right: 1610),
                                            shrinkWrap: true,
                                        ),
                                      ),

                                    ]
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  )
                ),
              );
            }
        )
    );
    });
  }

  Widget buildImage(String image, int index) =>
      Container(
        color: Colors.grey,
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      );

}