import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/components/custom_network_image.dart';
import 'package:test_task/components/custom_text.dart';
import 'package:test_task/view/details/meme_details_screen.dart';
import 'package:test_task/view_model/controller/home_controller.dart';

class HomeBodyWidget extends StatelessWidget {
  final HomeController homeController;
  const HomeBodyWidget({Key? key, required this.homeController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (homeController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final memeList = homeController.searchMemeList.isNotEmpty
            ? homeController.searchMemeList
            : homeController.memesList;

        return Center(
          child: ListView.builder(
            itemCount: memeList.length,
            itemBuilder: (context, index) {
              final meme = memeList[index];

              return InkWell(
                onTap: () {
                  Get.to(MemeDetailsScreen(
                      memesList: homeController.memesList[index]));
                },
                child: Card(
                  color: Colors.white,
                  child: Container(
                      height: 120,
                      color: Colors.white,
                      child: Row(
                        children: [
                          CustomNetworkImage(
                            image: meme.url.toString(),
                            height: 150,
                            width: 150,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: CustomText(
                              text: meme.name.toString(),
                              size: 25,
                            ),
                          )
                        ],
                      )),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
