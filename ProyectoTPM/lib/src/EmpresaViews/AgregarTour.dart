import 'package:flutter/material.dart';

class AgregarTours extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _AgregarTours();
  }
}

class _AgregarTours extends State<AgregarTours>{

  final _nombreInputTextController = TextEditingController();
  final _descripcionInputTextController = TextEditingController();
  final _costoInputTextController = TextEditingController();
  final _cantidadInputTextController = TextEditingController();
  final _ciudadInputTextController = TextEditingController();
  final _ImagenInputTextController = TextEditingController();

  var imagenes = [
    'https://th.bing.com/th/id/OIP.WgE46Tyz1KrK3qnuZnwi2wAAAA?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.WgE46Tyz1KrK3qnuZnwi2wAAAA?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.WgE46Tyz1KrK3qnuZnwi2wAAAA?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.WgE46Tyz1KrK3qnuZnwi2wAAAA?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.WgE46Tyz1KrK3qnuZnwi2wAAAA?pid=ImgDet&rs=1',
    'https://th.bing.com/th/id/OIP.WgE46Tyz1KrK3qnuZnwi2wAAAA?pid=ImgDet&rs=1',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children:<Widget>[
        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 28, top:10),
              child: const Text(
                "Nombre",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 13, right: 13),
              margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(93, 93, 93, 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                textAlign: TextAlign.left,
                controller: _nombreInputTextController,
                decoration: const InputDecoration(
                  hintText: '...',
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),

        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 28, top:10),
              child: const Text(
                "Descripción",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
            Container(
              height: Theme.of(context).textTheme.bodyText1!.fontSize! * 20,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 13, right: 13, top:8, bottom: 8),
              margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(93, 93, 93, 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                textAlign: TextAlign.left,
                controller: _descripcionInputTextController,
                decoration: const InputDecoration(
                  hintText: '...',
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),

        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 28, top:10),
              child: const Text(
                "Costo",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 13, right: 13),
              margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(93, 93, 93, 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                textAlign: TextAlign.left,
                controller: _costoInputTextController,
                decoration: const InputDecoration(
                  hintText: '...',
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),

        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 28, top:10, bottom: 10),
              child: const Text(
                "Imagenes",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 110,
                  height: 110,
                  // color: const Color.fromRGBO(234, 234, 234, 1.0),
                  margin: const EdgeInsets.only(left: 10, top:5, bottom: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(220, 220, 220, 1.0),  //PARA PROBAR CONTAINER
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(imagenes[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // shape: new RoundedRectangleBorder(
                      //       borderRadius: new BorderRadius.circular(10.0),
                      //   ),
                      primary: Colors.pinkAccent.withOpacity(0.0),
                      onPrimary: Colors.white.withOpacity(0.0),
                      // side: BorderSide(color: Colors.red, width: 1),
                    ),
                    onPressed: ()=>{_showModal(0),},
                    child: const Text(
                      'Agregar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  height: 110,
                  // color: const Color.fromRGBO(234, 234, 234, 1.0),
                  margin: const EdgeInsets.only(left: 10, right: 10, top:5, bottom: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(220, 220, 220, 1.0),  //PARA PROBAR CONTAINER
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(imagenes[1]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.withOpacity(0.0),
                      onPrimary: Colors.white.withOpacity(0.0),
                    ),
                    onPressed: ()=>{_showModal(1),},
                    child: const Text(
                      'Agregar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  height: 110,
                  // color: const Color.fromRGBO(234, 234, 234, 1.0),
                  margin: const EdgeInsets.only( right: 10, top:5, bottom: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(220, 220, 220, 1.0), //PARA PROBAR CONTAINER
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(imagenes[2]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.withOpacity(0.0),
                      onPrimary: Colors.white.withOpacity(0.0),
                    ),
                    onPressed: ()=>{_showModal(2),},
                    child: const Text(
                      'Agregar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 110,
                  height: 110,
                  // color: const Color.fromRGBO(234, 234, 234, 1.0),
                  margin: const EdgeInsets.only(left: 10, top:5, bottom: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(220, 220, 220, 1.0),  //PARA PROBAR CONTAINER
                    borderRadius: BorderRadius.circular(10.0),
                    image:  DecorationImage(
                      image: NetworkImage(imagenes[3]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.withOpacity(0.0),
                      onPrimary: Colors.white.withOpacity(0.0),
                    ),
                    onPressed: ()=>{_showModal(3),},
                    child: const Text(
                      'Agregar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  height: 110,
                  // color: const Color.fromRGBO(234, 234, 234, 1.0),
                  margin: const EdgeInsets.only(left: 10, right: 10, top:5, bottom: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(220, 220, 220, 1.0),  //PARA PROBAR CONTAINER
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(imagenes[4]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.withOpacity(0.0),
                      onPrimary: Colors.white.withOpacity(0.0),
                    ),
                    onPressed: ()=>{_showModal(4),},
                    child: const Text(
                      'Agregar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  height: 110,
                  // color: const Color.fromRGBO(234, 234, 234, 1.0),
                  margin: const EdgeInsets.only( right: 10, top:5, bottom: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(220, 220, 220, 1.0),  //PARA PROBAR CONTAINER
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(imagenes[5]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent.withOpacity(0.0),
                      onPrimary: Colors.white.withOpacity(0.0),
                    ),
                    onPressed: ()=>{ _showModal(5), },
                    child: const Text(
                      'Agregar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 28, top:10),
              child: const Text(
                "Cantidad de tours",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 13, right: 13),
              margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(93, 93, 93, 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                textAlign: TextAlign.left,
                controller: _cantidadInputTextController,
                decoration: const InputDecoration(
                  hintText: '...',
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),

        Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 28, top:10),
              child: const Text(
                "Ciudad",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 13, right: 13),
              margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(93, 93, 93, 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                textAlign: TextAlign.left,
                controller: _ciudadInputTextController,
                decoration: const InputDecoration(
                  hintText: '...',
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: Theme.of(context).textTheme.bodyText1!.fontSize! * 10.5,
              margin: const EdgeInsets.only(left:0, right: 6, top: 20, bottom: 20),
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
              margin: const EdgeInsets.only(left:6, right: 0, top: 20, bottom: 20),
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
                  'Agregar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<String?> _showModal(int index) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Agregar imagen'),
        actions: <Widget>[

          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 28, top:10),
                child: const Text(
                  "Ingrese el URL de la imagen",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 13, right: 13),
                margin: const EdgeInsets.only(left: 20, right: 20, top:5, bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(93, 93, 93, 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  textAlign: TextAlign.left,
                  controller: _ImagenInputTextController,
                  decoration:const  InputDecoration(
                    hintText: '...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () => {
                  _ImagenInputTextController.text = '',
                  Navigator.pop(context, 'Cancel'),
                },
                child: const Text('Cancel'),
              ),

              TextButton(
                onPressed: () => {
                  _getImage(index),
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

  void _getImage(int index) {
    setState(() {
      imagenes[index] = _ImagenInputTextController.value.text.toString();
      _ImagenInputTextController.text = '';
    });
  }
}