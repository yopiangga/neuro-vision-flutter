part of '../screens.dart';

class NotificationUserScreen extends StatelessWidget {
  NotificationUserScreen({super.key});

  NotificationService notificationService = NotificationService();

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
      body: FutureBuilder(
          future: notificationService.getNotification(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData || snapshot.data.length == 0) {
              return EmptySection(
                title: "Notification Empty",
                content: "All notifications will be recorded on notifications",
              );
            }
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data.length,
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
                          image: AssetImage(
                              'lib/assets/images/notification_icon.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title:
                        Text("${snapshot.data[index].notification['title']}"),
                    subtitle: Text(
                        "${snapshot.data[index].notification['description']}"),
                  ),
                );
              },
            );
          }),
    );
  }
}
