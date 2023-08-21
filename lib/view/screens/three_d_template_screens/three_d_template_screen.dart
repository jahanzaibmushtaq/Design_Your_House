import 'package:flutter/material.dart';
import 'package:design_your_house/controller/three_d_template_controller.dart';
import 'package:design_your_house/view/screens/three_d_template_screens/three_d_box_detail_screen.dart';
import 'package:get/get.dart';

class ThreeDTemplateScreen extends StatelessWidget {
  final ThreeDTemplateController controller = Get.put(ThreeDTemplateController());

  ThreeDTemplateScreen({Key? key}) : super(key: key);

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
        title: const Text('3D Screen'),
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
                    builder: (context) => ThreeDBoxDetailScreen(
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

  Widget _buildBox(BuildContext context, ThreeDBoxData threeDBoxData) {
    return GestureDetector(
      onTap: () {
        // Navigate to the relevant screen when the box is tapped.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ThreeDBoxDetailScreen(
               boxData: threeDBoxData,
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
              threeDBoxData.imageAssetPaths[0],
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
                  '${threeDBoxData.imageAssetPaths.length}',
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
                  threeDBoxData.heading,
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