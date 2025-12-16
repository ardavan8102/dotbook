import 'package:dotbook/consts/colors.dart';
import 'package:dotbook/presentation/widgets/appbar/appbar_with_return_icon.dart';
import 'package:dotbook/presentation/widgets/cards/file_center_card_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FileCenterPage extends StatelessWidget {
  const FileCenterPage({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBarWithReturnIcon(title: 'File Center'),
      backgroundColor: AppSolidColors.lightBackGround,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                spacing: 20,
                children: [
                  Expanded(
                    child: CardBoxWithIconItem(
                      size: size,
                      textTheme: textTheme,
                      icon: CupertinoIcons.book,
                      label: 'EPUB',
                      subtext: '130 files',
                      function: () {
                        
                      },
                    ),
                  ),

                  Expanded(
                    child: CardBoxWithIconItem(
                      size: size,
                      textTheme: textTheme,
                      icon: CupertinoIcons.bookmark,
                      label: 'PDF',
                      subtext: '56 files',
                      function: () {
                        
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}