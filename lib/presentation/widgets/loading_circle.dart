import 'package:dotbook/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinningLines extends StatelessWidget {
  const LoadingSpinningLines({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        spacing: 20,
        children: [
          SpinKitSpinningLines(color: AppSolidColors.accent, size: 140),
          Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: .bold),
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}
