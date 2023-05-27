part of '../screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthService auth = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //tunggu 2 detik
    _isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: CustomColor.main,
      child: Center(
        child: Image(
          image: AssetImage("lib/assets/images/splashscreen.png"),
        ),
      ),
    );
  }

  Future<void> _isLogin() async {
    //cek user login
    User? user = await auth.auth.currentUser;

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/main');
    } else {
      Navigator.pushReplacementNamed(context, '/sign_in');
    }
  }
}
