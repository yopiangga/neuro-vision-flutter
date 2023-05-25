import './hospital_model.dart';
import './patient_model.dart';
import './doctor_model.dart';

class Promise {
  Map<String, dynamic> diagnose;
  Doctor doctor;
  Hospital hospital;
  String image_scan;
  String note;
  Patient patient;
  String status;
  String time;

  Promise({
    required this.diagnose,
    required this.doctor,
    required this.hospital,
    required this.image_scan,
    required this.note,
    required this.patient,
    required this.status,
    required this.time,
  });

  factory Promise.fromJson(Map<String, dynamic> json) {
    return Promise(
      diagnose: json['diagnose'],
      doctor: Doctor.fromJson(json['doctor']),
      hospital: Hospital.fromJson(json['hospital']),
      image_scan: json['image_scan'],
      note: json['note'],
      patient: Patient.fromJson(json['patient']),
      status: json['status'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() => {
        "diagnose": diagnose,
        "doctor": doctor.toJson(),
        "hospital": hospital.toJson(),
        "image_scan": image_scan,
        "note": note,
        "patient": patient.toJson(),
        "status": status,
        "time": time,
      };
}
