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

class EmptySection extends StatelessWidget {
  const EmptySection({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

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
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 250,
            child: Text(
              content,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class LergeButton extends StatelessWidget {
  const LergeButton({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: CustomColor.main,
        borderRadius: BorderRadius.circular(50 / 2),
      ),
      child: Center(
        child: Text(
          content,
          style: whiteTextFont,
        ),
      ),
    );
  }
}
