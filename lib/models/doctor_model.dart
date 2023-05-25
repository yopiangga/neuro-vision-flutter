class Doctor {
  String email;
  String fullname;
  String uid;

  Doctor({
    required this.email,
    required this.fullname,
    required this.uid,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      email: json['email'],
      fullname: json['fullname'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "fullname": fullname,
        "uid": uid,
      };
}
