import 'package:design_your_house/controller/text_field_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ImageWidgetDataModel {
  Widget customImageWidget;
  ImageTextFieldController imageTextFieldTag;
  int index;
  ImageWidgetDataModel(
      { required this.imageTextFieldTag,
      required this.customImageWidget,
      required this.index});
}
