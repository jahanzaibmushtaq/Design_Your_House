import 'package:design_your_house/controller/image_preview_controller.dart';
import 'package:get/get.dart';

class ImagePreviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImagePreviewController());
  }
}
