import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';

import '../../shared/helper.dart';
import '../../shared/shared.dart';
import '../../models/hospital_model.dart';
import '../../models/promise_model.dart';
import '../../models/patient_model.dart';
import '../../models/notification_model.dart';
import '../../services/auth_service.dart';
import '../../services/hospital_service.dart';
import '../../services/promise_service.dart';
import '../../services/notification_service.dart';
import '../../services/patient_service.dart';
part '../widgets/widgets.dart';
part 'main_screen/main_screen.dart';
part './spalsh_screen/splash_screen.dart';

// USER SCREEN
part 'dashboard_screen/dashboard_screen.dart';
part 'dashboard_screen/detail_screen.dart';
part 'dashboard_screen/promise_screen.dart';
part 'dashboard_screen/success_screen.dart';
part 'history_screen/history_screen.dart';
part 'history_screen/detail_promise_screen.dart';
part 'notification_screen/notification_screen.dart';
part 'profile_screen/profile_screen.dart';
part 'profile_screen/change_password_screen.dart';
part 'sign_in_screen/sign_in_screen.dart';
part 'register_screen/register_screen.dart';
part 'map_screen/map_hospital_screen.dart';

// DOCTOR SCREEN
part 'dashboard_doctor_screen/dashboard_doctor_screen.dart';
part 'history_doctor_screen/history_doctor_screen.dart';
part 'history_doctor_screen/hospital_patient_screen.dart';
part 'history_doctor_screen/detail_patient_screen.dart';
part 'notification_doctor_screen/notification_doctor_screen.dart';
part 'profile_doctor_screen/profile_doctor_screen.dart';
