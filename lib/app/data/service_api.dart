import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sample_api/app/data/user_model.dart';

class ServiceApi {
  String apiUrl = "https://url-api/users";

  Future<List<User>> getUsers() async {
    var res = await http.get(Uri.parse('$apiUrl'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<User> listUser =
          body.map((dynamic item) => User().fromJson(item)).toList();
      return listUser;
    } else {
      print(res.body.toString());
      throw "Failed to get Users";
    }
  }

  Future<User> getUserById(String id) async {
    var res = await http.get(Uri.parse('$apiUrl/$id'));
    if (res.statusCode == 200) {
      return User().fromJson(json.decode(res.body));
    } else {
      print(res.body.toString());
      throw Exception('Failed to load a User');
    }
  }

  Future createUser(User user) async {
    var res = await http.post(
      Uri.parse('$apiUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    if (res.statusCode == 200) {
      print(res.body);
    } else {
      print(res.body);
      throw Exception('Failed to post User');
    }
  }

  Future updateUser(User user) async {
    var res = await http.put(
      Uri.parse('$apiUrl/${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    if (res.statusCode == 200) {
      print(res.body);
    } else {
      print(res.body);
      throw Exception('Failed to update User');
    }
  }

  Future deleteUser(String id) async {
    var res = await http.get(Uri.parse('$apiUrl/$id'));
    if (res.statusCode == 200) {
      print(res.body);
    } else {
      print(res.body);
      throw Exception('Failed to delete a User');
    }
  }
}
