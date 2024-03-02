import 'package:flutter/material.dart';

class NavBarButton extends StatelessWidget {
  
  final String titleTXT;
  final Color? colorTXT;
  
  const NavBarButton({
    super.key, 
    required this.titleTXT, this.colorTXT
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero)
          )
        )
      ),
      child: Text(
        titleTXT,
        style: TextStyle(
          color: colorTXT ?? Colors.red

        ),  
      ),
    );
  }
}