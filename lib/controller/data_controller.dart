import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_interview/model/Data%20Base/local_database.dart';
import 'package:project_interview/model/json_model.dart';
import 'package:project_interview/model/service/api_services.dart';

class DataController extends GetxController {
  // List<Entry> jsonMainList = [];
  Set<String> categoryList = {};
  List<Entry?> categorySubList = [];
  List<Entry> mainData = [];
  List<Database> database = [];

  @override
  void onInit() {
    super.onInit();
    getData();
    addDataToHive();
    
  }

  getData() async {
    try {
      final response = await ApiEndPoint().getData();
      if (response!.statusCode == 200 || response.statusCode == 201) {
        ApiProject datas = apiProjectFromJson(response.data);
        mainData = datas.entries;
        categoryList = categoryList = mainData.map((e) => e.category).toSet();

      
   
      }
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  addDataToHive()async{
    try {
         database = mainData
            .map((e) => Database(
                api: e.api,
                description: e.description,
                auth: e.auth,
                http: e.https.toString(),
                cors: e.cors,
                link: e.link,
                category: e.category))
            .toList();
        var localDatabase = await Hive.openBox("LocalData");
        await localDatabase.put("mainJson", database);

        update();
    } catch (e) {
      
      log(e.toString());
    }
}

  getsublist(String category) {
    print(category);
    categorySubList = mainData.map((e) {
      if (e.category == category) {
        return e;
      }
    }).toList();
    categorySubList.removeWhere((element) => element == null);
    update();
  }
}
