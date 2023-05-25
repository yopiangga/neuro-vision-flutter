import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification_model.dart';

class NotificationService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getNotification() async {
    try {
      var data = await firestore.collection('notification').get();
      // query by email
      var queryByEmail = data.docs
          .where((element) =>
              element.data()['user']['email'] == auth.currentUser!.email)
          .toList();

      //parsing data ke model promise
      List<Notification> notifications = [];
      for (var item in queryByEmail) {
        notifications
            .add(Notification.fromJson(item.data() as Map<String, dynamic>));
      }
      return notifications;
    } catch (e) {
      print("ERROR: $e");
    }
  }

  Future createNotification(String title, String description) async {
    //ambil data user
    User? user = auth.currentUser;
    DocumentSnapshot snapshot =
        await firestore.collection('user').doc(user!.uid).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    try {
      Notification notification = Notification(notification: {
        "title": title,
        "description": description,
      }, user: {
        "email": data['email'],
        "fullname": data['fullname'],
        "uid": data['uid'],
      });
      await firestore.collection('notification').add(notification.toJson());

      return true;
    } catch (e) {
      print("ERROR: $e");
      return false;
    }
  }
}
