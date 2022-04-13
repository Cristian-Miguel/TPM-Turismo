import 'package:flutter/material.dart';

class NeumorphicBottomNav extends StatefulWidget{
  final double bevel;
  final Offset blurOffset;
  final Color color;
  final EdgeInsets padding;

  NeumorphicBottomNav({
      Key? key,
      this.bevel = 15.0,
      this.padding = const EdgeInsets.all(1.5)
  }) : blurOffset = Offset(bevel / 2, bevel / 2),
      color = Colors.grey.shade200,
      super(key: key);
  @override
  State<NeumorphicBottomNav> createState() => _NeumorphicBottomNav();
}

class _NeumorphicBottomNav extends State<NeumorphicBottomNav>{
  final bool _isPressed = false;

  @override
  Widget build(BuildContext context){
    final color = widget.color;
    double height = 56;
    const primaryColor = Colors.pinkAccent;
    const secundaryColor = Colors.black54;
    return Listener(
       child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: widget.padding,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
             topLeft: Radius.circular(widget.bevel),
             topRight: Radius.circular(widget.bevel),
           ),
           gradient: LinearGradient(
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
             colors: [
               _isPressed ? color : color.mix(Colors.black, .1),
               _isPressed ? color.mix(Colors.black, .05) : color,
               _isPressed ? color.mix(Colors.black, .05) : color,
               color.mix(Colors.white, _isPressed ? .2 : .5),
             ],
             stops: const [
               0.0,
               .3,
               .6,
               1.0,
             ]),
           boxShadow: _isPressed ? null :
               [
                 BoxShadow(
                   blurRadius:  widget.bevel,
                   offset: -widget.blurOffset,
                   color: color.mix(Colors.white, .6)
                 ),
                 BoxShadow(
                     blurRadius:  widget.bevel,
                     offset: -widget.blurOffset,
                     color: color.mix(Colors.black, .3),
                 ),
               ]
         ),
         child: BottomAppBar(
           color: Colors.transparent,
           elevation: 0,
           child: Stack(
             children: [
               SizedBox(
                 height:  height,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        NavBarIcon(
                            text: 'Descubrir',
                            icon: Icons.search,
                            selected: true,
                            onPressed: (){

                            },
                            defaultColor: secundaryColor,
                            selectedColor: primaryColor,
                        ),
                        NavBarIcon(
                            text: "Favoritos",
                            icon: Icons.favorite,
                            selected: false,
                            onPressed: (){},
                            defaultColor: secundaryColor,
                            selectedColor: primaryColor,
                       ),
                       NavBarIcon(
                            text: "Reservas",
                            icon: Icons.send,
                            selected: false,
                            onPressed: (){},
                            defaultColor: secundaryColor,
                            selectedColor: primaryColor,
                       ),
                       NavBarIcon(
                            text: "Mensajes",
                            icon: Icons.message,
                            selected: false,
                            onPressed: (){},
                            defaultColor: secundaryColor,
                            selectedColor: primaryColor,
                       ),
                       NavBarIcon(
                            text: "Perfil",
                            icon: Icons.account_circle_outlined,
                            selected: false,
                            onPressed: (){},
                            defaultColor: secundaryColor,
                            selectedColor: primaryColor,
                       ),
                    ],
                 ),
               )
             ],
           ),
         ),
       ),
    );
  }
}

class NavBarIcon extends StatelessWidget{
  const NavBarIcon(
      {Key? key,
        required this.text,
        required this.icon,
        required this.selected,
        required this.onPressed,
        this.selectedColor = const Color( 0xffFF8527),
        this.defaultColor = Colors.black54
      }) : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:  MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}

extension ColorUtils on Color{
  Color mix(Color another, double amount){
    return Color.lerp(this, another, amount)!;
  }
}


class BarraInferior extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _BarraInferior();
  }
}

class _BarraInferior extends State<BarraInferior>{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pinkAccent,
          iconSize: 25.0,
          selectedFontSize: 14.0,
          unselectedFontSize: 12.0,
          items: const [
            BottomNavigationBarItem(
              label: 'Descubrir',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Favoritos',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Reservas',
              icon: Icon(Icons.send),
            ),
            BottomNavigationBarItem(
              label: 'Mensajes',
              icon: Icon(Icons.message),
            ),
            BottomNavigationBarItem(
              label: 'Perfil',
              icon: Icon(Icons.account_circle_outlined),
            ),
          ]
      );
  }
}
