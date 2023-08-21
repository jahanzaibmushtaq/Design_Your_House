import 'package:design_your_house/controller/text_field_controller.dart';
import 'package:design_your_house/model/text_field_data_model.dart';
import 'package:design_your_house/view/screens/picture_preview_screen/widget/custom_image_widget.dart';
import 'package:design_your_house/view/screens/picture_preview_screen/widget/custom_textfield_widget.dart';
import 'package:design_your_house/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsv_color_pickers/hsv_color_pickers.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';


class ImagePreviewController extends GetxController {
  final isStickerPanel = false.obs;
  final isTextPanel = false.obs;
  final widgetList = <dynamic>[].obs;
  final ScreenshotController screenshotController = ScreenshotController();
  final currentIndex = 0.obs;
  final isPermission = false.obs;
  HueController hueController = HueController(HSVColor.fromColor(Colors.red));
  void onPressStickerPanel() {
    isStickerPanel(true);
    isTextPanel(false);
  }

  void onPressTextPanel() {
    isTextPanel(true);
    isStickerPanel(false);
    onCreateNewField();
  }

  void onCreateNewField() {
    int cIndex = widgetList.length;
    widgetList.add(ImageWidgetDataModel(
        index: cIndex,
        imageTextFieldTag:
            Get.put(ImageTextFieldController(), tag: "tagInstance$cIndex"),
        customImageWidget: CustomTextFieldWidget(
          index: cIndex,
        )));

    onSelectField(cIndex);
  }

  void onCreateImage(String image) {
    int cIndex = widgetList.length;
    widgetList.add(ImageWidgetDataModel(
        index: cIndex,
        imageTextFieldTag:
            Get.put(ImageTextFieldController(), tag: "tagInstance$cIndex"),
        customImageWidget: CustomImageWidget(image: image)));
  }

  void onSelectField(int index) {
    isTextPanel(true);
    isStickerPanel(false);

    if (index >= 0 && index < widgetList.length) {
      currentIndex(index);
      hueController.value = HSVColor.fromColor(
        widgetList[currentIndex.value].imageTextFieldTag.colors.value,
      );
    }
  }

  onUpdateColor(Color color) {
    Get.find<ImageTextFieldController>(tag: "tagInstance${currentIndex.value}")
        .onChangeColor(color);
    widgetList[currentIndex.value].imageTextFieldTag.onChangeColor(color);
  }

  onUndoList() {
    int cIndex = widgetList.length;
    Get.delete<ImageTextFieldController>(tag: "tagInstance$cIndex");
    widgetList.removeLast();
  }

  onTakeScreenShotAndSave(BuildContext context) async {
    isPermission.value = await requestPermission();
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    screenshotController.capture().then((value) async {
      await ImageGallerySaver.saveImage(value!, name: fileName, quality: 80);
      CustomSnackBar.showMessage(context, "Image has been saved successfully");
      Get.back();
    }).onError((error, stackTrace) {
      throw Exception(error);
    });
  }




  Future<bool> requestPermission() async {
    try {
      await Permission.manageExternalStorage.request();
      await Permission.storage.request();

      return await Permission.storage.isGranted && await Permission.storage.isGranted;
    } on Exception catch (e) {
      return false;
    }
  }

  @override
  void onClose() {
    Get.delete<ImageTextFieldController>();
    for (ImageWidgetDataModel textFieldDataModel in widgetList) {
      Get.delete<ImageTextFieldController>(
          tag: "tagInstance${textFieldDataModel.index}");
    }
    widgetList.clear();

    super.onClose();
  }
}
