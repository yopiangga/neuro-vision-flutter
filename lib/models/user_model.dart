class Patient {
  final String email;
  final String fullname;
  final String uid;
  final String role = "patient";

  Patient({
    required this.email,
    required this.fullname,
    required this.uid,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      email: json['email'],
      fullname: json['fullname'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "fullname": fullname,
        "uid": uid,
        "role": role,
      };
}
