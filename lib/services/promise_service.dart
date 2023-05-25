import '../models/promise_model.dart';
import '../models/hospital_model.dart';
import '../models/patient_model.dart';
import '../models/doctor_model.dart';
import './notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PromiseService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  NotificationService notificationService = NotificationService();

  Future createPromise(Hospital hospital, Patient patient, String time,
      String doctorName) async {
    try {
      //cari dokter dari hospital
      var data;
      for (var item in hospital.doctors) {
        if (item['fullname'] == doctorName) {
          data = item;
        }
      }
      Doctor doctor = Doctor(
        email: data['email'],
        fullname: data['fullname'],
        uid: data['uid'],
      );

      Promise promise = Promise(
        diagnose: {
          "ai": "",
          "doctor": "",
        },
        doctor: doctor,
        hospital: hospital,
        image_scan: "",
        note: "-",
        patient: patient,
        status: "pending",
        time: time,
      );
      await firestore.collection('promise').add(promise.toJson());
      await notificationService.createNotification(
          "Create Promise Success", "Your promise has been created");

      return true;
    } catch (e) {
      print("ERROR: $e");
      return false;
    }
  }

  Future getPromise() async {
    try {
      var data = await firestore.collection('promise').get();
      // query by email
      var queryByEmail = data.docs
          .where((element) =>
              element.data()['patient']['email'] == auth.currentUser!.email)
          .toList();

      //parsing data ke model promise
      List<Promise> promises = [];
      for (var item in queryByEmail) {
        promises.add(Promise.fromJson(item.data() as Map<String, dynamic>));
      }
      return promises;
    } catch (e) {
      print("ERROR: $e");
    }
  }
}
