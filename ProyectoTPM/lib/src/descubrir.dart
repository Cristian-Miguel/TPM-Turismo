import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

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
  final _fechaEntradaInputTextController = TextEditingController();
  final _fechaSalidaInputTextController = TextEditingController();
  var FechaReserva = "Sin fecha";

  int activeIndex= 0;

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
                  onPressed: (){ _onChangeReserva(); },
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

  void _onChangeReserva() {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) {
              final CarouselController _controller = CarouselController();
              final List<String>  images = [
                'https://images.pexels.com/photos/3601425/pexels-photo-3601425.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                'https://images.pexels.com/photos/3601456/pexels-photo-3601456.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                'https://www.eluniversal.com.mx/sites/default/files/2019/05/17/playas-maruata-costa-michoacana.jpeg',
                'https://images.pexels.com/photos/3601369/pexels-photo-3601369.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                'https://images.pexels.com/photos/4602279/pexels-photo-4602279.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                'https://images.pexels.com/photos/163872/italy-cala-gonone-air-sky-163872.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                'https://images.pexels.com/photos/412681/pexels-photo-412681.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
              ];

              final List<String> descripimages = [
                'https://images.pexels.com/photos/1172518/pexels-photo-1172518.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',
                'https://images.pexels.com/photos/2403840/pexels-photo-2403840.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',
                'https://images.pexels.com/photos/4318913/pexels-photo-4318913.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
                'https://images.pexels.com/photos/462024/pexels-photo-462024.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',
              ];

              return Scaffold(
                appBar: AppBar(
                  title: const Text('Reservar', style: TextStyle(color: Colors.black),),
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
                                          child: const Text(
                                            "Playas Michoacanas",
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
                                                  child: const Text(
                                                    "4.71 Michoacan Morelia",
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
                                                  child: const Text(
                                                    "Experiencia ofrecida \n"
                                                        "por Maria Elena",
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
                                          child: const Text(
                                            "6.5 horas Idioma: Inglés y Español",
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
                                          child: const Text(
                                            "Michoacán tiene hermosas playas con buenos servicios en sus casi 230 km de litoral oceánico.\n"
                                                "Te invitamos a conocer nuestra selección con las mejores playas de Michoacán, esperando que"
                                                " puedas añadir algunas después de visitar la fantástica costa de este bello estado mexicano.",
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
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Container(
                                              margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                              child: RaisedButton(
                                                  color: Colors.pinkAccent,
                                                  textColor: Colors.white,
                                                  child: const Text(
                                                    "Reservar",
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                  onPressed: () {_onPressReserva();}),

                                            ),
                                          ],
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
  }

  void _onPressReserva() {
    Navigator.of(context).push(
      MaterialPageRoute(
      builder: (context) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Confirmar', style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.white,
              //centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black)
            ),
          body: ListView.builder(
            padding: const EdgeInsets.only(top: 10, right: 16, left: 16,bottom: 10),
            scrollDirection: Axis.vertical,
            itemCount: 1,
            itemBuilder: (
            BuildContext context, int index) {

                return Column(

                  children: [
                    Row(
                      children: <Widget> [
                        Container(
                          height: 125,
                          width: 125,
                          margin: new EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.yellow,  //PARA PROBAR CONTAINER
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: NetworkImage("https://images.pexels.com/photos/315998/pexels-photo-315998.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
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
                            margin: const EdgeInsets.only( left:16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget> [
                              Text(
                                "Tour Patzcuaro",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Disfrute la magia de patzcuaro verdaderamente el secrero mejor guardado de todas las ciudades coloniales de México",
                                style:TextStyle(
                                fontSize: 11,
                                color: Colors.black54
                                ),
                              ),
                              ]
                            ),
                          ),
                        ),
                    ],
                ),
                    Container(
                      child: const Divider(
                        color: Colors.black54,
                        thickness: 1,
                      ),
                    ),

                 Row(
                     children: <Widget> [
                       Container(
                         child: const Text(
                           "Tu viaje",
                           style: TextStyle(
                             fontSize: 22,
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                       )
                     ]
                  ),

                    Row(
                        children: <Widget> [
                          Container(
                            child: const Text(
                              "Fechas",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                         Expanded(
                           child: Container(
                             width: Theme.of(context).textTheme.bodyText1!.fontSize! * 30,
                             margin: const EdgeInsets.only(left:220),
                              child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10.0),
                                 ),
                                 primary: Colors.pinkAccent,
                                 onPrimary: Colors.white,
                                 // side: BorderSide(color: Colors.red, width: 1),
                               ),
                               onPressed: (){ _showDate();  },
                               child: const Text(
                                 'Editar',
                                 style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.w500,
                                 ),
                               ),
                             ),
                           ),

                          )
                        ]
                    ),
                    Row(
                        children: <Widget> [
                          Container(
                            child: Text(
                              FechaReserva,
                              style: const TextStyle(
                                fontSize: 14,
                                //fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ]
                    ),
                    Row(
                        children: <Widget> [
                          Container(
                            child: const Text(
                              "Personas",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: Theme.of(context).textTheme.bodyText1!.fontSize! * 30,
                              margin: const EdgeInsets.only(left:200),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  primary: Colors.pinkAccent,
                                  onPrimary: Colors.white,
                                  // side: BorderSide(color: Colors.red, width: 1),
                                ),
                                onPressed: (){},
                                child: const Text(
                                  'Editar',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                          )
                        ]
                    ),
                    Row(
                        children: <Widget> [
                          Container(
                            child: const Text(
                              "1 persona",
                              style: TextStyle(
                                fontSize: 14,
                                //fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ]
                    ),
                    Container(
                      child: const Divider(
                        color: Colors.black54,
                        thickness: 1,
                      ),
                    ),

                  ],

                );
          },
        )

        );
      },
    ),
    );
  }

  Future<String?> _showDate() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Dias a reservar'),
        actions: <Widget>[

          Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(left:20 ,right: 20),
                  margin: const EdgeInsets.only(top:5 ,bottom: 15),
                  // height:150,
                  child:Center(
                      child:TextField(
                        controller: _fechaEntradaInputTextController, //editing controller of this TextField
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today), //icon of text field
                            labelText: "Ingrese la fecha de Entrada" //label text of field
                        ),
                        readOnly: true,  //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context, initialDate: DateTime.now(),
                              firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101)
                          );

                          if(pickedDate != null ){
                            print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              _fechaEntradaInputTextController.text = formattedDate; //set output date to TextField value.
                            });
                          }else{
                            print("Date is not selected");
                          }
                        },
                      )
                  )
              ),
            ],
          ),

          Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(left:20 ,right: 20),
                  margin: const EdgeInsets.only(top:10 ,bottom: 40),
                  // height:150,
                  child:Center(
                      child:TextField(
                        controller: _fechaSalidaInputTextController, //editing controller of this TextField
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today), //icon of text field
                            labelText: "Ingrese la fecha de Salida" //label text of field
                        ),
                        readOnly: true,  //set it true, so that user will not able to edit text
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context, initialDate: DateTime.now(),
                              firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101)
                          );

                          if(pickedDate != null ){
                            print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement
                            setState(() {
                              _fechaSalidaInputTextController.text = formattedDate; //set output date to TextField value.
                            });
                          }else{
                            print("Date is not selected");
                          }
                        },
                      )
                  )
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () => {
                  // _ImagenInputTextController.text = '',
                  // _ChangeDateRerervate(),
                  Navigator.pop(context, 'Cancel'),
                },
                child: const Text('Cancel'),
              ),

              TextButton(
                onPressed: () => {
                  // _getImage(index),
                  // _ChangeDateRerervate(),
                  setState(() {
                    FechaReserva = _fechaSalidaInputTextController.text.toString() + ' - '+ _fechaEntradaInputTextController.text.toString();
                  }),
                  Navigator.pop(context, 'Guardar'),
                },
                child: const Text('Guardar'),
              ),
            ],
          ),

        ],
      ),
    );
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

