import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_ryuuichi/class/user.dart';
import 'package:flutter_ryuuichi/model/users_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SOOL掃除当番')),
      body: Container(
        child: FutureBuilder(
            future: UserFirestore.getUsersInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<User> userList = snapshot.data! as List<User>;
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(userList[index].name),
                      subtitle: Text(userList[index].clean),
                    );
                  },
                );
              }

              return Container();
            }),
      ),
    );
  }
}
