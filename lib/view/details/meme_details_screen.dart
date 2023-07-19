import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/components/custom_text.dart';
import 'package:test_task/model/Meme_model.dart';
import 'package:test_task/view/details/widgets/details_button_widget.dart';
import 'package:test_task/view/details/widgets/image_widget.dart';
import 'package:test_task/view_model/controller/details_controller.dart';

class MemeDetailsScreen extends StatelessWidget {
  final Memes memesList;
  MemeDetailsScreen({
    Key? key,
    required this.memesList,
  }) : super(key: key);

  final detailsController = Get.put(DetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Image from home screen

            ImageWidget(detailsController: detailsController, memesList: memesList),
            const SizedBox(height: 20),


            /// Edit and Save button
            DetailsButtonWidget(
              detailsController: detailsController,
              memesList: memesList,
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          detailsController.clearData();
          Get.back();
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: CustomText(
        text: memesList.name.toString(),
        size: 20,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
    );
  }
}
