part of '../screens.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("History Screen"),
          centerTitle: true,
          backgroundColor: CustomColor.main,
        ),
        body: Center(
          child: Text('History Screen'),
        ));
  }
}
