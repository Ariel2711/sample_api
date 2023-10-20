// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sample_api/app/data/user_model.dart';

import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  final GlobalKey<FormState> formKey = GlobalKey();
  User user = Get.arguments ?? User();
  @override
  Widget build(BuildContext context) {
    controller.modelToController(user);
    return Scaffold(
        appBar: AppBar(
          title: const Text('FormView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.namaC,
                      validator: (value) => value == null || value == ''
                          ? 'This field is required'
                          : null,
                      decoration: InputDecoration(label: Text("Nama")),
                    ),
                    TextFormField(
                      controller: controller.umurC,
                      validator: (value) => value == null || value == ''
                          ? 'This field is required'
                          : controller.checkIsInt(value) == false
                              ? 'Wrong Value'
                              : null,
                      decoration: InputDecoration(label: Text("Umur")),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          formKey.currentState?.validate() == true
                              ? await controller.storeUser(
                                  user, (user.id != null) ? true : false)
                              : Get.snackbar('Error', 'Data tidak valid');
                        },
                        child: Text("Submit"))
                  ],
                )),
          ),
        ));
  }
}
