import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posttest6_1915016121_rhennanurlisa/controller/homepage.dart';
import 'package:posttest6_1915016121_rhennanurlisa/controller/text_ctrl.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextController control = Get.put(TextController());
    return Drawer(
      backgroundColor: Color(0xff1f4690),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Text(
              "MENU KALENDER",
              style: TextStyle(
                  fontFamily: "poppins", fontSize: 20, color: Colors.black),
            ),
          ),
          ListTile(
            title: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Dasboard',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Calendar()));
            },
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            title: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.file_copy_sharp,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Agenda',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => For()));
            },
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
              title: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.other_houses_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Lainnya',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return SecondPage();
                })));
              }),
          SizedBox(
            height: 30,
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
              title: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Profil',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
