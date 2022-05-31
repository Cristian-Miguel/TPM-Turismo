import 'package:flutter/material.dart';

class Descubrir extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return _Descubrir();
  }
}

class _Descubrir extends State<Descubrir>{
  @override
  Widget build(BuildContext context) {
    List<String> listaDeOpciones = <String>["A","B","C","D","E","F","G"];
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
            itemCount: 6,
            itemBuilder: (ctx, i) {
              return Card(
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
                              'https://images.pexels.com/photos/1172518/pexels-photo-1172518.jpeg?auto=compress&cs=tinysrgb&h=650&w=940',
                               fit: BoxFit.fill,
                          ),
                        ),
                        const Text(
                          'Playas Michoacanas',
                          style: TextStyle(
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
                                   child: const Text(
                                     "4.71 (300)",
                                     style: TextStyle(
                                       fontSize: 10,
                                     ),
                                   )
                               ),
                             ]
                          ),
                          Row(
                            children: const [
                              Text(
                                'Desde 352 MXM p/p',
                                style: TextStyle(
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