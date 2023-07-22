import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/components/custom_network_image.dart';
import 'package:test_task/model/meme_model.dart';
import 'package:test_task/view_model/controller/details_controller.dart';

class ImageWidget extends StatelessWidget {
  final DetailsController detailsController;
  final Memes memesList;
  const ImageWidget(
      {Key? key, required this.detailsController, required this.memesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => detailsController.processedImageFile.value != null
            ? Image.file(
                File(detailsController.processedImageFile.value!.path),
                height: 300,
                width: Get.width,
              )
            : CustomNetworkImage(
                image: memesList.url.toString(),
                width: Get.width,
                height: 300,
              ),
      ),
    );
  }
}
