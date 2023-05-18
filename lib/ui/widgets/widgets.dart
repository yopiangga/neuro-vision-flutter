part of '../screens/screens.dart';

class ButtonQuery extends StatelessWidget {
  ButtonQuery({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.title,
  });

  int index;
  int selectedIndex;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: BoxDecoration(
        color: selectedIndex == index
            ? Color.fromARGB(34, 108, 78, 255)
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: selectedIndex == index ? CustomColor.main : Colors.black,
          ),
        ),
      ),
    );
  }
}
