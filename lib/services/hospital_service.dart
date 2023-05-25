import '../models/hospital_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getAllHospital() async {
    try {
      var data = await firestore.collection('hospital').get();
      //parsing data ke model hospital
      List<Hospital> hospitals = [];
      for (var item in data.docs) {
        hospitals.add(Hospital.fromJson(item.data() as Map<String, dynamic>));
      }
      return hospitals;
    } catch (e) {
      print("ERROR: $e");
    }
  }
}
