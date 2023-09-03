import './hospital_model.dart';
import './patient_model.dart';
import './doctor_model.dart';

class Promise {
  Map<String, dynamic> diagnose;
  Doctor doctor;
  Hospital hospital;
  String image_scan;
  String note_doctor;
  String note_admin;
  Patient patient;
  String status;
  String time;
  String id;

  Promise({
    required this.diagnose,
    required this.doctor,
    required this.hospital,
    required this.image_scan,
    required this.note_doctor,
    required this.note_admin,
    required this.patient,
    required this.status,
    required this.time,
    this.id = "",
  });

  factory Promise.fromJson(Map<String, dynamic> json) {
    return Promise(
      diagnose: json['diagnose'],
      doctor: Doctor.fromJson(json['doctor']),
      hospital: Hospital.fromJson(json['hospital']),
      image_scan: json['image_scan'],
      note_doctor: json['note_doctor'],
      note_admin: json['note_admin'],
      patient: Patient.fromJson(json['patient']),
      status: json['status'],
      time: json['time'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "diagnose": diagnose,
        "doctor": doctor.toJson(),
        "hospital": hospital.toJson(),
        "image_scan": image_scan,
        "note_doctor": note_doctor,
        "note_admin": note_admin,
        "patient": patient.toJson(),
        "status": status,
        "time": time,
        "id": id,
      };
}
