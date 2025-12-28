import 'package:dotbook/consts/colors.dart';
import 'package:dotbook/consts/strings.dart';
import 'package:dotbook/core/routes/app_routes.dart';
import 'package:dotbook/gen/assets.gen.dart';
import 'package:dotbook/presentation/widgets/drawer/drawer_menu_item.dart';
import 'package:dotbook/presentation/widgets/drawer/version_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawerMenu extends StatelessWidget {
  const CustomDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    
    return Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: size.height * .08, horizontal: 24),
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
                    label: 'PDF Reader',
                    labelIcon: Icons.folder_zip_outlined,
                    function: (){
                      Get.close(1); // pop out drawer before navigation
                      Get.toNamed(AppRoutes.pdfListPage);
                    },
                  ),

                  CustomDrawerMenuItem(
                    textTheme: textTheme,
                    label: 'Rate the App',
                    labelIcon: Icons.star_rate_outlined,
                    function: () async {
                      if (!await launchUrl(
                        Uri.parse('https://myket.ir/app/com.dotbook.app'),
                        mode: LaunchMode.externalApplication
                      )) {
                        throw Exception('could not resolve the url');
                      }
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