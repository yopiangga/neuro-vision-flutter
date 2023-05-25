part of '../screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  AuthService auth = AuthService();
  Map<String, dynamic>? data;
  final PageStorageBucket bucket = PageStorageBucket();
  AuthService authService = AuthService();
  Widget currentScreen = DashboardUserScreen();

  final List<Widget> screens = [
    // USER SCREEN
    DashboardUserScreen(),
    HistoryUserScreen(),
    NotificationUserScreen(),
    ProfileUserScreen(
      data: {},
    ),

    // DOCTOR SCREEN
    DashboardDoctorScreen(),
    HistoryDoctorScreen(),
    NotificationDoctorScreen(),
    ProfileDoctorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: auth.getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
                backgroundColor: Colors.white,
                body: Center(child: CircularProgressIndicator()));
          }
          Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
          String user = data['role'];

          return Scaffold(
            body: PageStorage(
              child: currentScreen,
              bucket: bucket,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
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
                            currentScreen = user == 'patient'
                                ? DashboardUserScreen()
                                : DashboardDoctorScreen();
                            currentIndex = 0;
                          });
                        },
                        child: Icon(
                          Icons.home_filled,
                          color: currentIndex == 0
                              ? CustomColor.main
                              : CustomColor.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = user == 'patient'
                                ? HistoryUserScreen()
                                : HistoryDoctorScreen();
                            currentIndex = 1;
                          });
                        },
                        child: Icon(
                          user == 'patient'
                              ? Icons.history
                              : Icons.people_outline,
                          color: currentIndex == 1
                              ? CustomColor.main
                              : CustomColor.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = user == 'patient'
                                ? NotificationUserScreen()
                                : NotificationDoctorScreen();
                            currentIndex = 2;
                          });
                        },
                        child: Icon(
                          Icons.notifications_outlined,
                          color: currentIndex == 2
                              ? CustomColor.main
                              : CustomColor.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        minWidth: 40,
                        onPressed: () {
                          setState(() {
                            currentScreen = user == 'patient'
                                ? ProfileUserScreen(data: data)
                                : ProfileDoctorScreen();
                            currentIndex = 3;
                          });
                        },
                        child: Icon(
                          Icons.person_outline,
                          color: currentIndex == 3
                              ? CustomColor.main
                              : CustomColor.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  bool _isPatient() {
    return authService.getUserRole() == 'patient';
  }
}
