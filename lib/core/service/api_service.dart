import 'dart:convert';

import 'package:test_task/core/res/app_url.dart';
import 'package:test_task/model/Meme_model.dart';
import 'package:http/http.dart'as http;
class ApiService{



  Future<List<Memes>> getMeme()async{
     List<Memes> memeList = [];
    final response = await http.get(Uri.parse(AppUrl.memeApi));

    if(response.statusCode==200){
      final responseBody = jsonDecode(response.body);

      for(var meme in responseBody['data']['memes']){
        memeList.add(Memes.fromJson(meme));
      }
    }

    return memeList;
  }

}