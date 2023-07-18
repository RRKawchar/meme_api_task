import 'package:get/get.dart';
import 'package:test_task/core/service/api_service.dart';
import 'package:test_task/model/Meme_model.dart';

class HomeController extends GetxController{
  final _apiService=ApiService();
  RxList<Memes> memesList=<Memes>[].obs;
  RxBool isLoading=false.obs;

  Future<void> getMemes()async{
     isLoading.value=true;
    try{
      final data=await _apiService.getMeme();
      memesList.value=data;
      print("Memes : ${memesList}");
      print("Memes : ${memesList.length}");

     isLoading.value=false;
    }catch(e){
     isLoading.value=false;
      print(e.toString());
    }
  }


}