part of '../screens.dart';

class ProfileUserScreen extends StatelessWidget {
  ProfileUserScreen({required this.data});
  Map<String, dynamic> data;

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
          ProfileImage(name: data['fullname']),
          ProfileName(name: data['fullname'], role: data['role']),
          EmailProfile(email: data['email']),
          LogoutButton(),
        ],
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  LogoutButton({
    super.key,
  });
  AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        auth.signOut();
        Navigator.pushReplacementNamed(context, '/sign_in');
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
  EmailProfile({
    required this.email,
    super.key,
  });
  String email;

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
              Text(email)
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
  ProfileName({
    required this.name,
    required this.role,
    super.key,
  });
  String name;
  String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 5),
          Text(
            role,
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
  ProfileImage({
    required this.name,
    super.key,
  });
  String name;

  @override
  Widget build(BuildContext context) {
    // ambil huruf pertama dari setiap kata
    String text = "";
    List<String> words = name.split(" ");
    for (var word in words) {
      text += word[0].toUpperCase();
    }

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
            text,
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
