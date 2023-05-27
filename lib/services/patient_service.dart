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

  Future getStatisticPatient() async {
    try {
      var promise = await firestore.collection('promise').get();
      var queryByEmail = promise.docs
          .where((element) =>
              element.data()['doctor']['email'] == auth.currentUser!.email)
          .toList();

      //ambil jumlah normal patient
      int normalPatient = 0;
      for (var item in queryByEmail) {
        if (item.data()['diagnose']['doctor'] == 'Normal') {
          normalPatient = normalPatient! + 1;
        }
      }

      //ambil jumlah patient stroke ischemic
      int strokeIschemicPatient = 0;
      for (var item in queryByEmail) {
        if (item.data()['diagnose']['doctor'] == 'Stroke Ischemic') {
          strokeIschemicPatient = strokeIschemicPatient! + 1;
        }
      }

      //ambil jumlah patient stroke hemorrhagic
      int strokeHemorrhagicPatient = 0;
      for (var item in queryByEmail) {
        if (item.data()['diagnose']['doctor'] == 'Stroke Hemorrhagic') {
          strokeHemorrhagicPatient = strokeHemorrhagicPatient! + 1;
        }
      }

      //ambil patient yang sudah classified
      int classifiedPatient = 0;
      for (var item in queryByEmail) {
        if (item.data()['diagnose']['doctor'] != "") {
          classifiedPatient = classifiedPatient! + 1;
        }
      }

      //ambil patient yang belum classified
      int unclassifiedPatient = 0;
      for (var item in queryByEmail) {
        if (item.data()['diagnose']['doctor'] == "") {
          unclassifiedPatient = unclassifiedPatient! + 1;
        }
      }

      Map<String, int> statistic = {
        'normal': normalPatient,
        'strokeIschemic': strokeIschemicPatient,
        'strokeHemorrhagic': strokeHemorrhagicPatient,
        'classified': classifiedPatient,
        'unclassified': unclassifiedPatient
      };

      return statistic;
    } catch (e) {
      print("ERROR: $e");
    }
  }

  Future getPatientPromise() async {
    try {
      var promise = await firestore.collection('promise').get();
      var queryByEmail = promise.docs
          .where((element) =>
              element.data()['doctor']['email'] == auth.currentUser!.email)
          .toList();

      List<Promise> promises = [];
      for (var item in queryByEmail) {
        //filter jika patient sudah ada di list
        if (promises
                .where((element) =>
                    element.patient.fullname ==
                    item.data()['patient']['fullname'])
                .toList()
                .length ==
            0) {
          promises.add(Promise.fromJson(item.data() as Map<String, dynamic>));
        }
      }

      return promises;
    } catch (e) {
      print("ERROR: $e");
    }
  }

  Future getHospitalPromise(String name) async {
    try {
      var promise = await firestore.collection('promise').get();
      var queryByEmail = promise.docs
          .where((element) =>
              element.data()['doctor']['email'] == auth.currentUser!.email)
          .toList();

      //filter hospital dengan patient yang sama
      List<Promise> promises = [];
      for (var item in queryByEmail) {
        if (item.data()['patient']['fullname'] == name) {
          promises.add(Promise.fromJson(item.data() as Map<String, dynamic>));
        }
      }

      return promises;
    } catch (e) {
      print("ERROR: $e");
    }
  }
}
