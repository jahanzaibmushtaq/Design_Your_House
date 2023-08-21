import 'package:design_your_house/controller/two_d_template_controller.dart';
import 'package:design_your_house/view/screens/two_d_template_screens/two_d_box_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TwoDTemplateScreen extends StatelessWidget {
  final TwoDTemplateController controller = Get.put(TwoDTemplateController());

  TwoDTemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen when the back button is pressed.
            Navigator.pop(context);
          },
        ),
        title: const Text('2D Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: controller.boxes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the relevant screen when the box is tapped.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TwoDBoxDetailScreen(
                      boxData: controller.boxes[index],
                    ),
                  ),
                );
              },
              child: _buildBox(context, controller.boxes[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBox(BuildContext context, TwoDBoxData boxData) {
    return GestureDetector(
      onTap: () {
        // Navigate to the relevant screen when the box is tapped.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TwoDBoxDetailScreen(
              boxData: boxData,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              boxData.imageAssetPaths[0],
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${boxData.imageAssetPaths.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  boxData.heading,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TwoDBoxData {
  final String heading;
  final String title;
  final List<String> imageAssetPaths;

  TwoDBoxData({
    required this.heading,
    required this.title,
    required this.imageAssetPaths,
  });
}
