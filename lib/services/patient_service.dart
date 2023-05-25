import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './promise_service.dart';
import '../models/promise_model.dart';
import '../models/patient_model.dart';

class PatientService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // PromiseService promiseService = PromiseService();

  Future getPatient() async {
    try {
      var promise = await firestore.collection('promise').get();
      var queryByEmail = promise.docs
          .where((element) =>
              element.data()['doctor']['email'] == auth.currentUser!.email)
          .toList();

      //ambil patient promise
      List<Patient> patients = [];
      for (var item in queryByEmail) {
        patients.add(
            Patient.fromJson(item.data()['patient'] as Map<String, dynamic>));
      }
      return patients;
    } catch (e) {
      print("ERROR: $e");
    }
  }
}
