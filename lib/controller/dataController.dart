import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/charityModel.dart';

class DataController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Charity> charitiesList = [];
  RxList orders = [].obs;

  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    return firestore.collection('cahrities').snapshots();
  }

  void addData(List<Charity> charityData) {
    List<Map> charity = [];
    charityData.forEach((charityData) {
      Map step = charityData.toMap();
      charity.add(step);
      firestore.collection('chrities').add(charityData.toMap());
      print('MMMMMMMMMMMMMMMM');
      print('Done');
    });
  }

  void addOrder(Products? order) {
    orders.value.add(order!);
    update();
  }
}
