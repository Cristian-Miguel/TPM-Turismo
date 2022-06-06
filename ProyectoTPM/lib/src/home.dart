import 'package:flutter/material.dart';
import 'package:proyectotmp/src/descubrir.dart';
import '../barra_inferior/barrainf.dart' as barra;

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Home();
  }
}

class _Home extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children:<Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(left:16, right: 10, top: 30),
            child: Text(
                "Descubre\nMichoacán",
                textAlign: TextAlign.left,
                style: TextStyle(
                   fontSize: 28,
                   fontWeight: FontWeight.w500,
                   color: Colors.black87.withOpacity(0.7),
                ),
            ),
          ),
          Container(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin:  const EdgeInsets.only(left: 16, top: 10),
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage ('assets/Hotel.png'),
                        fit: BoxFit.cover,
                        opacity: 0.5,
                      ),
                    ),
                    child: TextButton(
                      onPressed: (){
                        barra.desc = 1;
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder:(context) {return Descubrir();}
                            )
                        );
                      },
                      child: const Text(
                          "Hoteles",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:  const EdgeInsets.only(left: 16, top: 10),
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage ('assets/Restaurante.png'),
                        fit: BoxFit.cover,
                        opacity: 0.5,
                      ),
                    ),
                    child: const Center(

                      child: Text(
                        "Restaurantes",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:  const EdgeInsets.only(left: 16, top: 10),
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage ('assets/Tour.png'),
                        fit: BoxFit.cover,
                        opacity: 0.5,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Tours",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:  const EdgeInsets.only(left: 16, top: 10),
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage ('assets/Viajes.png'),
                        fit: BoxFit.cover,
                        opacity: 0.5,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Viajes",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:  const EdgeInsets.only(left: 16, right:16, top: 10),
                    width: 120,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage ('assets/Paquete.png'),
                        fit: BoxFit.cover,
                        opacity: 0.5,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Paquetes",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
          ),

          Container(
            height: 400,
            width: Theme.of(context).textTheme.bodyText1!.fontSize! * 30,
            margin:  const EdgeInsets.only(left: 16, right:16, top: 25, bottom: 25),
            decoration: BoxDecoration(
                color: Colors.black87,  //PARA PROBAR CONTAINER
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage ('assets/Tirolesa.png'),
                  //NetworkImage("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/7a/ea/98/caption.jpg?w=500&h=400&s=1"),
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
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 16, right:16, top: 25, bottom: 4),
                  child: const Text(
                    "¡Actividades\npara tu viaje!",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 16, right:16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(left: 30, right:30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      primary: Colors.white,
                      onPrimary: Colors.black12,
                      // side: BorderSide(color: Colors.red, width: 1),
                    ),
                    onPressed: (){},
                    child: const Text(
                      'Experiencias',
                      style: TextStyle(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        Container(
          height: 400,
          width: Theme.of(context).textTheme.bodyText1!.fontSize! * 30,
          margin:  const EdgeInsets.only(left: 16, right:16, top: 18, bottom: 25),
          decoration: BoxDecoration(
              color: Colors.black,  //PARA PROBAR CONTAINER
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage ('assets/Carnitas.png'),
                // NetworkImage("https://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2020/09/como-se-hacen-las-carnitas-facil.jpg"),
                fit: BoxFit.cover,
                opacity: 0.7,
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
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16, right:16, top: 25, bottom: 4),
                child: const Text(
                  "Disfruta de\nnuestra gastronomía",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16, right:16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.only(left: 30, right:30),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                    primary: Colors.white,
                    onPrimary: Colors.black12,
                    // side: BorderSide(color: Colors.red, width: 1),
                  ),
                  onPressed: (){},
                  child: const Text(
                    'Experiencias',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}