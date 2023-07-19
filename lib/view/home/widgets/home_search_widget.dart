import 'package:flutter/material.dart';
import 'package:test_task/view_model/controller/home_controller.dart';

class HomeSearchWidget extends StatelessWidget {
  final HomeController homeController;
  const HomeSearchWidget({Key? key, required this.homeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: homeController.filterController.value,
      onChanged: (value) {
        homeController.searchMemes(value);
      },
      onSubmitted: (value) {
        homeController.searchFocusNode.value.unfocus();
      },
      decoration: InputDecoration(
        hintText: "Search....",
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: () {

            homeController.filterController.value.clear();
            homeController.searchMemes('');
            homeController.searchFocusNode.value.unfocus();
          },
          icon: const Icon(Icons.close),
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
