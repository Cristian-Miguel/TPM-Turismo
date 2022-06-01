
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:proyectotmp/src/LogIn.dart';
import 'Registro.dart';
import 'sesion.dart';
import '../barra_inferior/barrainf.dart' as barra;

class Perfil extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return _Perfil();
  }
}

class _Perfil extends State<Perfil>{
  final _emailInputTextController = TextEditingController();
  final _passwordInputTextController = TextEditingController();
  late sesionFunctions sF = new sesionFunctions();
  late bool isLogin = barra.isLogin;
  var idUser = barra.idUser;
  var name = barra.user;

  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(isLogin) return editSettings();
    else return logIn();
  }

  editSettings(){
    return Container(
      child: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top:25 ,bottom: 40),
                    width: 90,
                    height: 90,
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
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Hola, ${name.toString()}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const Divider(
                color: Colors.black38,
              ),

              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top:25 ,bottom: 20, left: 10),
                    child: const Text(
                        "Configuración de la cuenta",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.account_circle_outlined),
                      title: const Text('Información  personal'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: (){},
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.money_sharp),
                      title: const Text('Pagos y cobros'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: (){},
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.add_alert),
                      title: const Text('Notificaciones'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: (){},
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.announcement_sharp),
                      title: const Text('Privacidad'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: (){},
                    ),
                  ),
                ],
              ),

              Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top:20 ,bottom: 20, left: 10),
                    child: const Text(
                      "Asistencia",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                        leading: const Icon(Icons.account_balance),
                        title: const Text('Como funciona ExploraMich'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () => {
                          Navigator.of(context).pop(),
                        }
                    ),
                  ),
                  Card(
                    child: ListTile(
                        leading: const Icon(Icons.money_sharp),
                        title: const Text('Comunícate con el servicio de ayuda'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () => {
                          Navigator.of(context).pop(),
                        }
                    ),
                  ),
                  Card(
                    child: ListTile(
                        leading: const Icon(Icons.help),
                        title: const Text('Recibir Ayuda'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () => {
                          Navigator.of(context).pop(),
                        }
                    ),
                  ),
                  Card(
                    child: ListTile(
                        leading: const Icon(Icons.app_registration),
                        title: const Text('Envía Tus comentarios'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () => {
                          Navigator.of(context).pop(),
                        }
                    ),
                  ),

                ],
              ),
            ],
        ),
      ),
    );
  }

  logIn(){

    return Center(
      child: SizedBox(
        width: 600,
        child: Card(
          child: SingleChildScrollView(
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
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _emailInputTextController,
                    decoration: InputDecoration(
                      hintText: '...Correo...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left:12, right: 12, bottom: 10),
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
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _passwordInputTextController,
                    decoration: InputDecoration(
                      hintText: '...Contraseña...',
                      border: InputBorder.none,
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
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
                        onPressed: (){
                          sF.getUser(_emailInputTextController.text, _passwordInputTextController.text, context);

                        },
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
                    onPressed: _onChangeRegistro,
                    child: const Text(
                      'Registrate',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _onChangeRegistro(){
    Navigator.of(context).push(
        MaterialPageRoute(
            builder:(context)
            {
              return Registro();
            }
        )
    );
  }
}