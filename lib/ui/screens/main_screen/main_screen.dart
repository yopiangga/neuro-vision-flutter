part of '../screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    // USER SCREEN
    DashboardUserScreen(),
    HistoryUserScreen(),
    NotificationUserScreen(),
    ProfileUserScreen(),

    // DOCTOR SCREEN
    DashboardDoctorScreen(),
    HistoryDoctorScreen(),
    NotificationDoctorScreen(),
    ProfileDoctorScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashboardUserScreen();
  String user = "dokter"; //TODO: get user from memory

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = user == 'user'
                          ? DashboardUserScreen()
                          : DashboardDoctorScreen();
                      currentIndex = 0;
                    });
                  },
                  child: Icon(
                    Icons.home_filled,
                    color:
                        currentIndex == 0 ? CustomColor.main : CustomColor.grey,
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = user == 'user'
                          ? HistoryUserScreen()
                          : HistoryDoctorScreen();
                      currentIndex = 1;
                    });
                  },
                  child: Icon(
                    user == 'user' ? Icons.history : Icons.people_outline,
                    color:
                        currentIndex == 1 ? CustomColor.main : CustomColor.grey,
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = user == 'user'
                          ? NotificationUserScreen()
                          : NotificationDoctorScreen();
                      currentIndex = 2;
                    });
                  },
                  child: Icon(
                    Icons.notifications_outlined,
                    color:
                        currentIndex == 2 ? CustomColor.main : CustomColor.grey,
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = user == 'user'
                          ? ProfileUserScreen()
                          : ProfileDoctorScreen();
                      currentIndex = 3;
                    });
                  },
                  child: Icon(
                    Icons.person_outline,
                    color:
                        currentIndex == 3 ? CustomColor.main : CustomColor.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
