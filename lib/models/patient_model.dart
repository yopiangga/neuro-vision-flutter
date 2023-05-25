class Patient {
  String dob;
  String email;
  String fullname;
  String nik;
  String pob;

  Patient({
    required this.dob,
    required this.email,
    required this.fullname,
    required this.nik,
    required this.pob,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      dob: json['dob'],
      email: json['email'],
      fullname: json['fullname'],
      nik: json['nik'],
      pob: json['pob'],
    );
  }

  Map<String, dynamic> toJson() => {
        "dob": dob,
        "email": email,
        "fullname": fullname,
        "nik": nik,
        "pob": pob,
      };
}
