import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ryuuichi/class/user.dart';

//ユーザーの情報を取ってこようとしてる
//get

class UserFirestore {
  static final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
//  FirebaseFirestore.instance.collection('users').doc('OE5RsxjHcjF9SojNf4Ry').get();
//firebaseから取ってきたユーザーの情報をgetできるメソッド(機械)を作成;
  static Future<dynamic> getUsersInfo() async {
    List<User> userList = []; //取ってきたやつをListにぶちこみたい
    try {
      var snapshot = await users.get();
      var doc = snapshot.docs;
      for (int i = 0; i < 2; i++) {
        Map<String, dynamic> data = doc[i].data() as Map<String, dynamic>;
        //map型に変換
        User user =
            User(name: data['name'], clean: data['clean'], id: data['id']);
        userList.add(user);
      }
      print('ユーザー情報取得完了');
      return userList;
    } catch (e) {
      print(e);
      return null;
      //futurebuilderのsnapshot.dataに飛んでいく
    }
  }
}
