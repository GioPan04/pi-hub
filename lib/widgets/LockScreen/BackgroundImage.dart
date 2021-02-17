import 'package:flutter/widgets.dart';
import 'package:pi_hub/repositories/PeriodicImageProvider.dart';
import 'package:provider/provider.dart';

class LockBackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PeriodicImageProvider>(
      builder: (context, image, _) => Image.memory(
        image.backgroundPicture,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}