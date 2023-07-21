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
    try {
      isLoading.value = true;
      dynamic responseBody = await ApiService.handleResponse(
        await ApiService.getRequest(),
      );
      if (responseBody != null) {
        memesList.value = [];
        for (var meme in responseBody['data']['memes']) {
          memesList.add(Memes.fromJson(meme));
        }
      } else {
        isLoading.value = false;
        throw 'Unable to load announcement list!';
      }
    } catch (e) {
      print(e.toString());
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }



  void searchMemes(String value) {
    searchMemeList.value = memesList.where((meme) {
      return meme.name!.toLowerCase().contains(value.toLowerCase());
    }).toList();
  }
}
