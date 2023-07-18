import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/view_model/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController=Get.put(HomeController());

  @override
  void initState() {
    homeController.getMemes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        if(homeController.isLoading.value){
          return const Center(child: CircularProgressIndicator(),);
        }
        return Center(child:Text("Home Screen") ,);
      }),
    );
  }
}
