part of '../screens.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          SizedBox(height: 75),
          Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                children: [
                  Image.asset(
                    'lib/assets/images/logo.png',
                    width: 75,
                    height: 75,
                  ),
                ],
              )),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              'Change Password',
              textAlign: TextAlign.left,
              style: darkTextFont.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Enter old password',
                hintText: 'Enter old password',
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusColor: CustomColor.main,
                fillColor: CustomColor.main,
                labelText: 'Enter new password',
                hintText: 'Enter new password',
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusColor: CustomColor.main,
                fillColor: CustomColor.main,
                labelText: 'Confirm new password',
                hintText: 'Confirm new password',
              ),
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () => Navigator.of(context).pushReplacementNamed("/main"),
              child: LergeButton(content: "Submit"),
            ),
          ),
        ],
      ),
    ));
  }
}
