import 'package:dotbook/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerBottomNavigation extends StatelessWidget {
  const PdfViewerBottomNavigation({
    super.key,
    required PdfController pdfController,
  }) : _pdfController = pdfController;

  final PdfController _pdfController;
  

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(12),
      height: size.height * .1,
      width: size.width,
      decoration: BoxDecoration(
        color: AppSolidColors.darkCreama.withValues(alpha: .6)
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .center,
        children: [

          pageNavigatorIconButton(false),

          PdfPageNumber(
            controller: _pdfController,
            builder: (context, loadingState, page, pagesCount) {
              return Container(
                alignment: .center,
                child: Text(
                  '$page/${pagesCount ?? 0}',
                  style: const TextStyle(fontSize: 20, color: AppSolidColors.darkBorder),
                ),
              );
            },
          ),

          pageNavigatorIconButton(true),
        ],
      ),
    );
  }

  GestureDetector pageNavigatorIconButton(bool showNext) {
    return GestureDetector(
      onTap: () {
        if (!showNext) {
          _pdfController.previousPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        } else {
          _pdfController.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppSolidColors.accent,
          borderRadius: .circular(10),
        ),
        child: Icon(
          showNext ? Icons.navigate_next : Icons.navigate_before,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}