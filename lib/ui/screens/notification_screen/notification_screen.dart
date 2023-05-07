part of '../screens.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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

class EmptyNotif extends StatelessWidget {
  const EmptyNotif({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/emptyicon.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "Notification Empty",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 250,
            child: Text(
              "All notifications will be recorded on notifications",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
