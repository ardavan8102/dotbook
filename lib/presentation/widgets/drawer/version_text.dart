import 'package:dotbook/helpers/get_application_info.dart';
import 'package:flutter/material.dart';

class AppVersionText extends StatelessWidget {
  const AppVersionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetApplicationInfo.getAppVersion(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('Loading ...');
        }
    
        return Text(
          'Application Version ${snapshot.data}',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false
          ),
        );
      },
    );
  }
}