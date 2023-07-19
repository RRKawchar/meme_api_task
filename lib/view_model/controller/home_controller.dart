import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_task/core/service/api_service.dart';
import 'package:test_task/model/Meme_model.dart';

class HomeController extends GetxController {
  final _apiService = ApiService();
  final filterController = TextEditingController().obs;

  RxList<Memes> memesList = <Memes>[].obs;
  RxBool isLoading = false.obs;
  Rx<FocusNode> searchFocusNode = FocusNode().obs;

  RxList<Memes> searchMemeList = <Memes>[].obs;

  Future<void> getMemes() async {
    isLoading.value = true;
    try {
      final data = await _apiService.getMeme();
      memesList.value = data;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  void searchMemes(String value) {
    searchMemeList.value = memesList.where((meme) {
      return meme.name!.toLowerCase().contains(value.toLowerCase());
    }).toList();
  }
}
