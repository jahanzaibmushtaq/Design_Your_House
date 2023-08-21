import 'package:design_your_house/controller/image_preview_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBoldItalicCheckBoxWidget extends StatelessWidget {
  const CustomBoldItalicCheckBoxWidget({
    super.key,
    required this.imagePreviewController,
  });

  final ImagePreviewController imagePreviewController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
                () => Checkbox(
              onChanged: (value) {
                int currentIndex = imagePreviewController.currentIndex.value;
                if (currentIndex >= 0 && currentIndex < imagePreviewController.widgetList.length) {
                  imagePreviewController
                      .widgetList[currentIndex]
                      .imageTextFieldTag
                      .isBold(value);
                }
              },
              value: imagePreviewController
                  .currentIndex.value < imagePreviewController.widgetList.length
                  ? imagePreviewController
                  .widgetList[imagePreviewController.currentIndex.value]
                  .imageTextFieldTag
                  .isBold
                  .value
                  : false,
            ),
          ),
          const Text("Bold"),
          Obx(
                () => Checkbox(
              onChanged: (value) {
                int currentIndex = imagePreviewController.currentIndex.value;
                if (currentIndex >= 0 && currentIndex < imagePreviewController.widgetList.length) {
                  imagePreviewController
                      .widgetList[currentIndex]
                      .imageTextFieldTag
                      .isItalic(value);
                }
              },
              value: imagePreviewController
                  .currentIndex.value < imagePreviewController.widgetList.length
                  ? imagePreviewController
                  .widgetList[imagePreviewController.currentIndex.value]
                  .imageTextFieldTag
                  .isItalic
                  .value
                  : false,
            ),
          ),
          const Text("Italic"),
        ],
      ),
    );
  }
}
