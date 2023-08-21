import 'package:design_your_house/view/screens/picture_preview_screen/picture_preview_screen.dart';
import 'package:design_your_house/view/screens/two_d_template_screens/two_d_custom_image_box.dart';
import 'package:design_your_house/view/screens/two_d_template_screens/two_d_template_screen.dart';
import 'package:flutter/material.dart';

class TwoDBoxDetailScreen extends StatelessWidget {
  final TwoDBoxData boxData;

  const TwoDBoxDetailScreen({Key? key, required this.boxData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(boxData.heading),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: boxData.imageAssetPaths.length,
        itemBuilder: (context, index) {
          return TwoDCustomImageBox(
            imageAssetPath: boxData.imageAssetPaths[index],
            onEditTap: () {
              // Navigate to the EditImageScreen when the edit icon is tapped.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PicturePreviewScreen(
                    selectedImage: boxData.imageAssetPaths[index],
                  ),
                ),
              );
            },
            onPreviewTap: () {
              // Show the image when the box or preview text is tapped.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: const Text('Preview'),
                    ),
                    body: Center(
                      child: Image.asset(
                        boxData.imageAssetPaths[index],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
