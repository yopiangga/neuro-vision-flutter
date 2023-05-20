part of '../screens.dart';

class ProfileDoctorScreen extends StatefulWidget {
  const ProfileDoctorScreen({super.key});

  @override
  State<ProfileDoctorScreen> createState() => _ProfileDoctorScreenState();
}

class _ProfileDoctorScreenState extends State<ProfileDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile", style: darkTextFont),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          ProfileImage(),
          ProfileName(),
          EmailProfile(),
          LogoutButton(),
        ],
      ),
    );
  }
}
