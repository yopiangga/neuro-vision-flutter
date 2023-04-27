part of '../screens.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
              'Sign In',
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
                labelText: 'Email',
                hintText: 'Email',
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
                labelText: 'Password',
                hintText: 'Password',
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?',
                  style: mainTextFont.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 60),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Row(
              children: [
                Expanded(
                    child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/main");
                  },
                  color: CustomColor.main,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'Sign In',
                    style: whiteTextFont.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin + 10),
              child: Text.rich(TextSpan(
                  text: "By continuing, you agree to our",
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Terms of Service',
                      style: mainTextFont.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CustomColor.main,
                      ),
                    ),
                    TextSpan(
                      text: ' and ',
                      style: darkTextFont.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: mainTextFont.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: CustomColor.main,
                      ),
                    ),
                  ]))),
          SizedBox(height: 40),
        ],
      ),
    ));
  }
}
