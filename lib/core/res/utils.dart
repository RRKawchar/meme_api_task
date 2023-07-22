

 import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

kPrint(String text){
  if(kDebugMode){
    print(text);
  }
}


kSnackBar(String title,String message){
  Get.snackbar(title, message,
    snackPosition: SnackPosition.BOTTOM,
  );
}