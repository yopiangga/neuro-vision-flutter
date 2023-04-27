part of '../screens.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard Screen"),
          centerTitle: true,
          backgroundColor: CustomColor.main,
        ),
        body: Center(
          child: Text('Dashboard Screen'),
        ));
  }
}
