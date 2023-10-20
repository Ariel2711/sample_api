import 'package:sample_api/app/data/user_model.dart';
import 'package:sample_api/app/data/service_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  ServiceApi serviceApi = ServiceApi();

  TextEditingController namaC = TextEditingController();
  TextEditingController umurC = TextEditingController();

  bool checkIsInt(String? text) {
    try {
      int.parse(text ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  modelToController(User user) {
    namaC.text = user.nama ?? '';
    umurC.text = (user.umur ?? '').toString();
  }

  controllerToModel(User user) {
    user.nama = namaC.text;
    user.umur = int.tryParse(umurC.text);
    return User;
  }

  Future<void> storeUser(User user, bool isUpdate) async {
    try {
      user = controllerToModel(user);
      !isUpdate
          ? await serviceApi.createUser(user)
          : await serviceApi.updateUser(user);

      Get.back();
      Get.snackbar('Success', 'User berhasil disimpan');
    } catch (e) {
      print(e.toString());
    }
  }
}
