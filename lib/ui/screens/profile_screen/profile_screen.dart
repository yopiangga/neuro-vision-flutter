part of '../screens.dart';

class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({super.key});

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

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignInScreen(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: CustomColor.main),
          borderRadius: BorderRadius.circular(50 / 2),
        ),
        child: Center(
          child: Text(
            "Logout",
            style: TextStyle(color: CustomColor.main),
          ),
        ),
      ),
    );
  }
}

class EmailProfile extends StatelessWidget {
  const EmailProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.email, color: CustomColor.grey),
              SizedBox(width: 10),
              Text("yopiangga@it.student.pens.ac.id")
            ],
          ),
          SizedBox(height: 5),
          Divider(),
          SizedBox(height: 5),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangePasswordScreen(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.lock, color: CustomColor.grey),
                    SizedBox(width: 10),
                    Text("Change Password"),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: CustomColor.grey,
                  size: 15,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Divider(),
        ],
      ),
    );
  }
}

class ProfileName extends StatelessWidget {
  const ProfileName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Alfian Prisma Yopiangga",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Patient",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromARGB(34, 108, 78, 255),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            "AY",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CustomColor.main,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
