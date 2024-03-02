import 'package:flutter/material.dart';


class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key, required this.imageLogo, required this.itemsNav, this.backgrondColor});

  final String imageLogo;
  final List<Widget> itemsNav; 
  final Color? backgrondColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: backgrondColor ?? Colors.grey,
      width: double.infinity,
      child: Row(
        children: [
          Image(image: AssetImage(imageLogo)),
          const Spacer(),
          for(var navbarItem in itemsNav) navbarItem,
        ],
      ),
    );
  }
}