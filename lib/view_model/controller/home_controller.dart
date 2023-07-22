import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_task/core/res/api_url.dart';
import 'package:test_task/core/res/utils.dart';
import 'package:test_task/core/service/api_service.dart';
import 'package:test_task/model/meme_model.dart';

class HomeController extends GetxController {

  final filterController = TextEditingController().obs;

  RxList<Memes> memesList = <Memes>[].obs;
  RxBool isLoading = false.obs;
  Rx<FocusNode> searchFocusNode = FocusNode().obs;

  RxList<Memes> searchMemeList = <Memes>[].obs;


  @override
  void onInit() {
    getMemes();
    super.onInit();
  }

  @override
  void onClose() {
    filterController.value.dispose();
    kPrint("Dispose Check : ${filterController.value}");
    super.onClose();
  }


  Future<void> getMemes() async {
    try {
      isLoading.value = true;
      dynamic responseBody = await ApiService.handleResponse(
        await ApiService.getRequest(AppUrl.memeApi),
      );
      if (responseBody != null) {
        memesList.value = [];
        for (var meme in responseBody['data']['memes']) {
          memesList.add(Memes.fromJson(meme));
        }
      } else {
        isLoading.value = false;
        throw 'Unable to load meme list';
      }
    } catch (e) {
      kPrint(e.toString());
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
