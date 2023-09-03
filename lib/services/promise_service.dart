import '../models/promise_model.dart';
import '../models/hospital_model.dart';
import '../models/patient_model.dart';
import '../models/doctor_model.dart';
import './notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class PromiseService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  NotificationService notificationService = NotificationService();

  Future createPromise(Hospital hospital, Patient patient, String time,
      String doctorName) async {
    try {
      //cari dokter dari hospital
      String uid = Uuid().v4();
      // var data;
      // for (var item in hospital.doctors) {
      //   if (item['fullname'] == doctorName) {
      //     data = item;
      //   }
      // }
      // Doctor doctor = Doctor(
      //   email: data['email'],
      //   fullname: data['fullname'],
      //   uid: data['uid'],
      // );
      Doctor doctor = Doctor(
        email: "",
        fullname: "",
        uid: "",
      );

      Promise promise = Promise(
        diagnose: {
          "ai": "",
          "doctor": "",
        },
        doctor: doctor,
        hospital: hospital,
        image_scan: "",
        note_doctor: "-",
        note_admin: "-",
        patient: patient,
        status: "pending",
        time: "",
        id: uid,
      );
      await firestore.collection('promise').doc(uid).set(promise.toJson());

      Map<String, dynamic> dataNotification = {};
      await firestore
          .collection('user')
          .where('email', isEqualTo: patient.email)
          .get()
          .then((value) {
        dataNotification = {
          'email': value.docs[0].data()['email'],
          'fullname': value.docs[0].data()['fullname'],
          'uid': value.docs[0].data()['uid'],
        };
      });
      await notificationService.createNotification(
        "Create Promise Success",
        "Your promise has been created",
        dataNotification,
      );

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

  void updatePromise(String stroke, String note, Promise promise) async {
    try {
      //update data promise byId
      await firestore.collection('promise').doc(promise.id).update({
        "diagnose": {
          "ai": "",
          "doctor": stroke,
        },
        "note": note,
        "status": "done",
      });

      Map<String, dynamic> dataNotificationDoctor = {
        'email': promise.doctor.email,
        'fullname': promise.doctor.fullname,
        'uid': promise.doctor.uid,
      };
      await notificationService.createNotification(
        "Update Promise Success",
        "Your promise has been updated",
        dataNotificationDoctor,
      );

      Map<String, dynamic> dataNotificationPatient = {};
      await firestore
          .collection('user')
          .where('email', isEqualTo: promise.patient.email)
          .get()
          .then((value) {
        dataNotificationPatient = {
          'email': value.docs[0].data()['email'],
          'fullname': value.docs[0].data()['fullname'],
          'uid': value.docs[0].data()['uid'],
        };
      });
      await notificationService.createNotification(
        "Promise accepted",
        "Your promise has been accepted by doctor ${promise.doctor.fullname}",
        dataNotificationPatient,
      );
    } catch (e) {
      print("ERROR: $e");
    }
  }

  String? getEmail() {
    //ambil email user yang login
    return auth.currentUser!.email;
  }
}
