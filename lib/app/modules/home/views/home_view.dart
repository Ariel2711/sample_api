import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sample_api/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FutureBuilder(
                    future: controller.loadUsers(),
                    builder: (context, snapshot) => snapshot.connectionState ==
                            ConnectionState.waiting
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.purple,
                          ))
                        : Container(
                            height: Get.height * 0.8,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 6.5 / 9,
                                crossAxisCount: 2,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                              ),
                              itemCount: controller.listUser.length,
                              itemBuilder: (context, index) => Card(
                                  child: Column(
                                children: [
                                  Text(controller.listUser[index].nama ?? ''),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton.icon(
                                      onPressed: () {
                                        Get.toNamed(Routes.FORM,
                                            arguments:
                                                controller.listUser[index]);
                                      },
                                      icon: Icon(Icons.edit),
                                      label: Text("edit")),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton.icon(
                                      onPressed: () {
                                        controller.deleteUser(
                                            controller.listUser[index]);
                                      },
                                      icon: Icon(Icons.delete),
                                      label: Text("delete"))
                                ],
                              )),
                            )))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.FORM),
          child: Icon(Icons.add),
        ));
  }
}
