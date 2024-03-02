/*
  * Cartas que se despliegan una al lado de la otra
  * conotienen titulo contenido y boton
*/

import 'package:flutter/material.dart';

class CustomCards extends StatefulWidget {
  const CustomCards({super.key});

  @override
  State<CustomCards> createState() => _CustomCardsState();
}

class _CustomCardsState extends State<CustomCards> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<Offset> _animation1;
  late Animation<Offset> _animation2;
  late Animation<Offset> _animation3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000)
    );

    _animation1 = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.33, curve: Curves.easeIn),
    ));

    _animation2 = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.33, 0.66, curve: Curves.easeIn),
    ));

    _animation3 = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.66, 1.0, curve: Curves.easeIn),
    ));


    //Iniciar la animacion al cargar en widget
    _controller.forward();
    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SlideTransition(
            position: _animation1,
            child: const CardContent(
              icon: Icons.abc,
              title: 'Desarrollamos a la medida de tus necesidades',
              contentCardText: 'Nostrud ipsum aute dolore elit fugiat velit ullamco pariatur dolor aliquip dolor est. Est exercitation tempor ad nostrud. Ipsum labore ex amet elit pariatur dolore anim proident eu irure. Aliquip ullamco incididunt ut veniam voluptate Lorem commodo eiusmod aliqua dolor. Consectetur eu sunt ut enim ea labore ullamco laborum esse sunt. Elit labore aliquip do in. Commodo exercitation ipsum deserunt voluptate velit deserunt non mollit dolor irure ea ea.',
            )
          ),
        SlideTransition(
          position: _animation2,
          child: const CardContent(
            icon: Icons.abc,
              title: 'Seguimiento y crecimiento',
              contentCardText: 'Nostrud ipsum aute dolore elit fugiat velit ullamco pariatur dolor aliquip dolor est. Est exercitation tempor ad nostrud. Ipsum labore ex amet elit pariatur dolore anim proident eu irure. Aliquip ullamco incididunt ut veniam voluptate Lorem commodo eiusmod aliqua dolor. Consectetur eu sunt ut enim ea labore ullamco laborum esse sunt. Elit labore aliquip do in. Commodo exercitation ipsum deserunt voluptate velit deserunt non mollit dolor irure ea ea.',
          )
        ),
        SlideTransition(
          position: _animation3,
          child: const CardContent(
            icon: Icons.abc,
              title: 'Promocion',
              contentCardText: 'Nostrud ipsum aute dolore elit fugiat velit ullamco pariatur dolor aliquip dolor est. Est exercitation tempor ad nostrud. Ipsum labore ex amet elit pariatur dolore anim proident eu irure. Aliquip ullamco incididunt ut veniam voluptate Lorem commodo eiusmod aliqua dolor. Consectetur eu sunt ut enim ea labore ullamco laborum esse sunt. Elit labore aliquip do in. Commodo exercitation ipsum deserunt voluptate velit deserunt non mollit dolor irure ea ea.',
          )
        ),
      
        ],
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.contentCardText,
    this.enableButton = false, 
    this.buttonTitle = 'title', 
    this.onPressButton, 
  });

  final IconData icon;
  final String title;
  final String contentCardText;
  final bool? enableButton;
  final String? buttonTitle;
  final VoidCallback? onPressButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.20,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.white,
              child: Image(image: AssetImage('/ic_app.png'),)
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            title, 
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600
            ),),
          const SizedBox(height: 15,),
          Text(
            contentCardText, 
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey
            ),),
          const SizedBox(height: 10,),
          FilledButton.tonal(
            onPressed: onPressButton, 
            child: const Text(
              'Explorar'
            )
          )
        ],
      ),
    );
  }
}