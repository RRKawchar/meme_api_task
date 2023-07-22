import 'package:flutter/material.dart';
import 'package:test_task/components/custom_text.dart';
import 'package:test_task/model/meme_model.dart';
import 'package:test_task/view_model/controller/details_controller.dart';

class DetailsButtonWidget extends StatelessWidget {
  final DetailsController detailsController;
  final Memes memesList;
  const DetailsButtonWidget(
      {Key? key, required this.detailsController, required this.memesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {
              detailsController.editImage(memesList.url.toString());
            },
            icon: const Icon(Icons.edit),
            label: const CustomText(
              text: "Edit",
            ),
          ),
          TextButton.icon(
            onPressed: () {
              detailsController.saveImageToGallery();
            },
            icon: const Icon(Icons.save),
            label: const CustomText(
              text: "Save",
            ),
          ),
        ],
      ),
    );
  }
}
