import 'package:dotbook/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomDrawerMenu extends StatelessWidget {
  const CustomDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: size.height * .1, horizontal: 20),
        color: AppSolidColors.lightCreama,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text('Itme')
          ],
        ),
      ),
    );
  }
}