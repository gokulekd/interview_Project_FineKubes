import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:project_interview/constants/colors.dart';
import 'package:project_interview/constants/icons.dart';
import 'package:project_interview/controller/data_controller.dart';
import 'package:project_interview/model/Data%20Base/local_database.dart';
import 'package:project_interview/view/widgets/search_bar.dart';
import '../model/json_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              controller.getsublist("Animals");
            },
            icon: Icon(iconSearch)),
        title: const Text("Categories "),
      ),
      body: SafeArea(
        child: GetBuilder<DataController>(
          init: DataController(),
          builder: (controller) => controller.categoryList.isEmpty
              ? const Center(
                  child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator()))
              : ListView.builder(
                  itemCount: controller.categoryList.length,
                  itemBuilder: (context, index) {
                    print(controller.categoryList.length);
                    List<String> categoryList =
                        controller.categoryList.toList();
                    return ExpansionTile(
                      onExpansionChanged: ((value) {
                        if (value == true) {
                          controller.getsublist(categoryList[index]);
                          controller.update();
                        }
                      }),
                      tilePadding: const EdgeInsets.all(8),
                      childrenPadding: const EdgeInsets.all(8),
                      title: Text(categoryList[index]),
                      children: [
                        const SearchBar(),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.categorySubList.length,
                          itemBuilder: (context, index) {
                            var data = controller.categorySubList[index];
                            return ListTile(
                              title: Text(data!.api.toString()),
                              subtitle: Text(data.description.toString()),
                              trailing: IconButton(
                                onPressed: () async {
                                  var localDatabase =
                                      await Hive.openBox("LocalData");
                                  localDatabase.deleteAt(index);
                                },
                                icon: Icon(
                                  iconDelete,
                                  color: kred,
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
