import 'package:dotbook/consts/colors.dart';
import 'package:dotbook/consts/strings.dart';
import 'package:dotbook/gen/assets.gen.dart';
import 'package:dotbook/presentation/widgets/drawer/drawer_menu_item.dart';
import 'package:dotbook/presentation/widgets/drawer/version_text.dart';
import 'package:flutter/material.dart';

class CustomDrawerMenu extends StatelessWidget {
  const CustomDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: size.height * .08, horizontal: 24),
        color: AppSolidColors.lightCreama,
        child: Column(
          crossAxisAlignment: .center,
          children: [
            // Header
            DrawerHeaderContainer(textTheme: textTheme),

            // List View : Drawer Items
            Expanded(
              child: ListView(
                children: [
                  CustomDrawerMenuItem(
                    textTheme: textTheme,
                    label: 'File Center',
                    labelIcon: Icons.folder_zip_outlined,
                    function: () {
                      
                    },
                  ),

                  CustomDrawerMenuItem(
                    textTheme: textTheme,
                    label: 'Rate The App',
                    labelIcon: Icons.star_outline,
                    function: () {
                      
                    },
                  ),

                  CustomDrawerMenuItem(
                    textTheme: textTheme,
                    label: 'Settings',
                    labelIcon: Icons.settings_applications_outlined,
                    function: () {
                      
                    },
                  ),

                  CustomDrawerMenuItem(
                    textTheme: textTheme,
                    label: 'About App',
                    labelIcon: Icons.question_mark_outlined,
                    function: () {
                      
                    },
                  ),
                ],
              ),
            ),

            // Version text
            AppVersionText(),
          ],
        ),
      ),
    );
  }
}



class DrawerHeaderContainer extends StatelessWidget {
  const DrawerHeaderContainer({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(
          width: 2,
          color: AppSolidColors.accent
        )),
        borderRadius: .only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
      ),
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: .center,
        spacing: 12,
        children: [
          // Image
          Image.asset(
            Assets.brand.dotbookLogo.path,
            width: 50,
            height: 50,
          ),
    
          // brand Name
          Text(
            AppStrings.brandName,
            style: textTheme.labelLarge,
          )
        ],
      ),
    );
  }
}