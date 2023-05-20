part of '../screens.dart';

class NotificationUserScreen extends StatelessWidget {
  const NotificationUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Notification", style: darkTextFont),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
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
