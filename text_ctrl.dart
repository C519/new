import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  var namaAgenda = "".obs;
  var waktuAgenda = "".obs;
  
  final namaAgendaCtrl = TextEditingController();
  final waktuAgendaCtrl = TextEditingController();

  // onPressed() {
  //   namaAgenda = namaAgendaCtrl.text.obs;
  //   waktuAgenda = waktuAgendaCtrl.text.obs;

  // }

  // // Mirip dispose() di Stateful
  // @override
  // void onClose() {
  //   namaAgendaCtrl.dispose();
  //   waktuAgendaCtrl.dispose();
  //   super.onClose();
  // }

}