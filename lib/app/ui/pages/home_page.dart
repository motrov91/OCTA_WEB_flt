import 'package:flutter/material.dart';
import 'package:octa_web/app/ui/widgets/customCards.dart';
import 'package:octa_web/app/ui/widgets/customNavbar.dart';
import '../shared/buttons/navbarButton.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int counter = 10;
  List<Widget> items = [
    const NavBarButton(
      titleTXT: 'Inicio',
      colorTXT: Color(0xffFFFFFF),
    ),
    const NavBarButton(
      titleTXT: 'Sitios web',
      colorTXT: Color(0xffFFFFFF),
    ),
    const NavBarButton(
      titleTXT: 'Servicios',
      colorTXT: Color(0xffFFFFFF),
    ),
    const NavBarButton(
      titleTXT: 'Procesos',
      colorTXT: Color(0xffFFFFFF),
    ),
    const NavBarButton(
      titleTXT: 'Asociados',
      colorTXT: Color(0xffFFFFFF),
    ),
    const NavBarButton(
      titleTXT: 'Contacto',
      colorTXT: Color(0xffFFFFFF),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdeeef3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /** Header y slideshow */
            Container(
              height: MediaQuery.of(context).size.height,
              color: const Color(0xffdeeef3),
              child: Stack(
                children: [
                  Image(image: const AssetImage('bg_home.jpg'), fit: BoxFit.cover, width: double.infinity, height: MediaQuery.of(context).size.height * 0.8,),       
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomNavbar(
                        imageLogo: 'LogoOCTA.png',
                        itemsNav: items,
                        backgrondColor: Colors.transparent,
                      ),
                      const Spacer(),
                    ]),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        CustomCards(),
                        
                      ],
                    )),
                ],
              ),
            ),
            Container(
              color: const Color(0xffdeeef3),
              height: MediaQuery.of(context).size.height,
              child: const Center(child: Text('contenedor lo que hacemos')),
            ),
            Container(
              color: Colors.orange,
              height: MediaQuery.of(context).size.height,
              child: const Center(child: Text('contenedor como lo hacemos')),
            )
          ],
        ),
      )
    );
  }
}

// Stack(
//   children: [
//     Image(image: const AssetImage('bg_home.jpg'), fit: BoxFit.cover, width: double.infinity, height: MediaQuery.of(context).size.height * 0.8,),       
//     Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CustomNavbar(
//           imageLogo: 'LogoOCTA.png',
//           itemsNav: items,
//           backgrondColor: Colors.transparent,
//         ),
//         const Spacer(),
//       ]),
//     const Positioned(
//       bottom: 0,
//       left: 0,
//       right: 0,
//       child: Column(
//         children: [
//           CustomCards(),
          
//         ],
//       )),
//   ],
// ),