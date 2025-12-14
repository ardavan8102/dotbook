import 'package:dotbook/core/controllers/home_controller.dart';
import 'package:dotbook/presentation/widgets/appbar_with_return_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithReturnIcon(title: 'DotBook'),
      body: SafeArea(
        child: Stack(
          children: [

            /// Chapters List
            Obx(() {
              if (controller.loading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.chapters.isEmpty) {
                return const Center(
                  child: Text('Select an EPUB file to begin'),
                );
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: ListView.builder(
                  itemCount: controller.chapters.length,
                  itemBuilder: (_, i) {
                    final chapter = controller.chapters[i];
                    return ListTile(
                      title: Text(chapter.title),
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
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black26,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: controller.selectEpub,
                        child: const Text('Select EPUB'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.chapters.clear,
                        child: const Text('Clear'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
