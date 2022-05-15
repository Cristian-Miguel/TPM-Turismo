
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _Perfil();
  }
}

class _Perfil extends State<Perfil>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            width: 90,
            height: 90,
            // color: const Color.fromRGBO(32, 32, 32, 0.7),
            decoration: BoxDecoration(
              color: Color.fromRGBO(32, 32, 32, 0.7),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
                Icons.card_travel,
              color: Colors.white,
              size: 60,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left:12, right: 12, bottom: 10),
            alignment: Alignment.centerLeft,
            child: const Text(
                "Correo Electrónico",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            margin: const EdgeInsets.only(left:12, right: 12),
            decoration: BoxDecoration(
              color: Color.fromRGBO(93, 93, 93, 0.1), borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '...Correo...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left:12, right: 12, bottom: 10, top: 25),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Contraseña",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            margin: const EdgeInsets.only(left:12, right: 12),
            decoration: BoxDecoration(
              color: Color.fromRGBO(93, 93, 93, 0.1), borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '...Contraseña...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: Theme.of(context).textTheme.bodyText1!.fontSize! * 10.5,
                margin: const EdgeInsets.only(left:0, right: 6, top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    primary: Colors.white54,
                    onPrimary: Colors.white,
                    // side: BorderSide(color: Colors.red, width: 1),
                  ),
                  onPressed: (){},
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Container(
                width: Theme.of(context).textTheme.bodyText1!.fontSize! * 14.5,
                margin: const EdgeInsets.only(left:6, right: 0, top: 20),

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    primary: Colors.pinkAccent,
                    onPrimary: Colors.white,
                    // side: BorderSide(color: Colors.red, width: 1),
                  ),
                  onPressed: (){},
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
          TextButton(
              onPressed: (){},
              child: const Text(
                  'Olvide mi contraseña',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
              ),
          ),
          const Divider(
              color: Colors.black38,
          ),

          Container(
            width: Theme.of(context).textTheme.bodyText1!.fontSize! * 30,
            margin: const EdgeInsets.only(left:16, right: 16, top: 10),

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                primary: Colors.pinkAccent,
                onPrimary: Colors.white,
                // side: BorderSide(color: Colors.red, width: 1),
              ),
              onPressed: (){},
              child: const Text(
                'Registrate',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),

        ],
      ) ,
    );
  }
}