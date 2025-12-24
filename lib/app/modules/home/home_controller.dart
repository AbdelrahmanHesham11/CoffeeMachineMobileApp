import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Map<String, dynamic>> machines = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    machines.bindStream(getMachines());
  }

  Stream<List<Map<String, dynamic>>> getMachines() {
    return FirebaseFirestore.instance
        .collection('machines')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Map<String, dynamic>> result = <Map<String, dynamic>>[];
      for (var element in query.docs) {
        result.add(element.data() as Map<String, dynamic>);
      }
      update();
      return result;
    });
  }
}
