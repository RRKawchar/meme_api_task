import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class DetailsController extends GetxController{

  final ImageCropper _imageCropper = ImageCropper();
  Rx<CroppedFile?> processedImageFile = Rx<CroppedFile?>(null);



  Future<File> _downloadImage(String image) async {
    final response = await http.get(Uri.parse(image));
    final bytes = response.bodyBytes;
    final appDir = await getTemporaryDirectory();
    final filePath = "${appDir.path}/temp_image.jpg";
    return File(filePath).writeAsBytes(bytes);
  }


  Future<void> editImage(String image) async {
    final sourceFile = await _downloadImage(image);
    final croppedImage = await _imageCropper.cropImage(
      sourcePath: sourceFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );

    if (croppedImage != null) {
      processedImageFile.value = croppedImage;
    }
  }


  Future<void> saveImageToGallery() async {
    if (processedImageFile.value != null) {
      final result = await ImageGallerySaver.saveImage(File(processedImageFile.value!.path).readAsBytesSync());
      print("My Result : $result");
      if (result['isSuccess']) {
        Get.snackbar(
          "Success",
          "Image saved to gallery",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          "Failed to save image",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        "Error",
        "No processed image to save",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }



  void clearData(){
    processedImageFile.value = null;
  }


}