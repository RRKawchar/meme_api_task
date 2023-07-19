import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/components/custom_text.dart';
import 'package:test_task/view/home/widgets/home_body_widget.dart';
import 'package:test_task/view/home/widgets/home_search_widget.dart';
import 'package:test_task/view_model/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());



  @override
  void initState() {
    homeController.getMemes();
    super.initState();
  }
  @override
  void dispose() {
    homeController.filterController.value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Search Field......
            HomeSearchWidget(
              homeController: homeController,
            ),

            const SizedBox(height: 10),

            const CustomText(
              text: 'Memes',
              fontWeight: FontWeight.bold,
              size: 20,
            ),

            const SizedBox(height: 10),
            Expanded(
              child:HomeBodyWidget(homeController: homeController,)
            ),
          ],
        ),
      ),
    ));
  }
}
