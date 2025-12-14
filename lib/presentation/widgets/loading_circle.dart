import 'package:dotbook/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinningLines extends StatelessWidget {
  const LoadingSpinningLines({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitSpinningLines(color: AppSolidColors.accent, size: 140),
    );
  }
}
