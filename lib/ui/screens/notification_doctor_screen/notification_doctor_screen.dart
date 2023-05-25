part of '../screens.dart';

class NotificationDoctorScreen extends StatefulWidget {
  const NotificationDoctorScreen({super.key});

  @override
  State<NotificationDoctorScreen> createState() =>
      _NotificationDoctorScreenState();
}

class _NotificationDoctorScreenState extends State<NotificationDoctorScreen> {
  NotificationService notificationServices = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Notification", style: darkTextFont),
        centerTitle: true,
      ),
      // body: EmptySection(
      //   title: "Notification Empty",
      //   content: "All notifications will be recorded on notifications",
      // ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 2.5, horizontal: 20),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage('lib/assets/images/notification_icon.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text("Notification Title"),
              subtitle: Text("Notification Subtitle"),
            ),
          );
        },
      ),
    );
  }
}
