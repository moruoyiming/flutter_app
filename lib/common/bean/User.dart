import 'dart:convert';
import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
// user.g.dart 将在我们运行生成命令后自动生成
// part 'user.g.dart';
///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'email': email,
      };

  what() {
    User userBean = User("Jian", "798774875@qq.com");
    String jsons = json.encode(userBean);
    Map userMap = json.decode(jsons);
    var user = User.fromJson(userMap);
    print('Howdy, ${user.name}!');
    print('We sent the verification link to ${user.email}.');
  }
}
