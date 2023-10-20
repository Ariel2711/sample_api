import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample_api/app/data/user_model.dart';
import 'package:sample_api/app/data/service_api.dart';

class HomeController extends GetxController {
  RxList<User> listUser = <User>[].obs;

  final ServiceApi serviceApi = ServiceApi();

  Future<List<User>> loadUsers() async {
    return listUser.value = await serviceApi.getUsers();
  }

  Future<void> deleteUser(User user) async {
    try {
      await serviceApi.deleteUser(user.id.toString());
      Get.snackbar('Success', 'User berhasil dihapus');
    } catch (e) {
      print(e);
    }
  }
}
