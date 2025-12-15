import 'package:dotbook/consts/colors.dart';
import 'package:dotbook/consts/strings.dart';
import 'package:dotbook/core/controllers/home_controller.dart';
import 'package:dotbook/core/models/chapter_meta.dart';
import 'package:dotbook/presentation/views/chapter_content.dart';
import 'package:dotbook/presentation/widgets/appbar_with_return_icon.dart';
import 'package:dotbook/presentation/widgets/custom_button.dart';
import 'package:dotbook/presentation/widgets/loading_circle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.find<HomeController>(); // TODO : Add Bindings

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppSolidColors.lightBackGround,
      appBar: AppBarWithReturnIcon(title: AppStrings.brandName),
      body: SafeArea(
        child: Stack(
          children: [
            /// Chapters List
            Obx(() {
              if (controller.loading.value) {
                return LoadingSpinningLines();
              }

              if (controller.chapters.isEmpty) {
                return const Center(
                  child: Text('Select an EPUB file to begin'),
                );
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: ListView.builder(
                  itemCount: controller.chapters.length,
                  itemBuilder: (_, i) {
                    final chapter = controller.chapters[i];
                    return Padding(
                      padding: EdgeInsets.all(16),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: .circular(12),
                          onTap: () async {
                            await Future.delayed(Duration(milliseconds: 300));
                            Get.to(
                              () => ChapterContentPage(),
                              arguments: {
                                'path' : controller.bookPath,
                                'chapter' : chapter
                              }
                            );
                          },
                          splashColor: AppSolidColors.darkCreama,
                          highlightColor: AppSolidColors.darkCreama,
                          child: chaptersListViewTile(chapter)
                        )
                      ),
                    );
                  },
                ),
              );
            }),

            /// Bottom Buttons
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: bottomActionButtons(size),
            ),
          ],
        ),
      ),
    );
  }

  // Chapter Tile
  ListTile chaptersListViewTile(ChapterMeta chapter) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      tileColor: AppSolidColors.darkCreama.withValues(alpha: .2),
      shape: RoundedRectangleBorder(
        borderRadius: .circular(12),
        side: BorderSide(width: 1, color: AppSolidColors.darkCreama)
      ),
      title: Text(
        chapter.title,
        style: TextStyle(
          color: AppSolidColors.accent,
        ),
      ),
      trailing: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppSolidColors.accent,
          borderRadius: .circular(12)
        ),
        child: Icon(
          Icons.chevron_right,
          color: Colors.white,
        ),
      ),
    );
  }

  // Bottom Buttons
  Container bottomActionButtons(Size size) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: size.height * .1,
      decoration: BoxDecoration(
        color: AppSolidColors.lightCreama,
        border: Border(
          top: BorderSide(width: 1, color: AppSolidColors.darkCreama),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            color: Colors.black.withValues(alpha: .1),
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: size.height * .08,
              child: CustomElevatedButton(
                function: controller.selectEpub,
                msg: 'Select EPUB File',
                bgColor: AppSolidColors.accent,
                textColor: Colors.white,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: SizedBox(
              height: size.height * .08,
              child: CustomElevatedButton(
                function: () => controller.clearLibrary(),
                msg: 'Clear',
                bgColor: Colors.red.withValues(alpha: .2),
                textColor: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
