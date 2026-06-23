import 'package:flutter/material.dart';
import 'package:greenlife/layer/screen/doctor/appointment/DoctorAppointment.dart';
import 'package:greenlife/layer/screen/patient/insurance/InsurancePage.dart';
import 'package:greenlife/layer/screen/patient/medicine/MedicineScreen.dart';
import 'package:greenlife/layer/screen/patient/reports/Emergency.dart';
import 'package:greenlife/layer/screen/patient/reports/HealthRecord.dart';
import 'package:greenlife/layer/screen/patient/reports/PatientReport.dart';
import '../../layer/screen/DashboardScreen.dart';
import '../../layer/screen/doctor/appointment/FindDoctorScreen.dart';
import '../../layer/screen/doctor/appointment/ViewProfile.dart';
import '../../layer/SplashScreen.dart';


class AppRoute {
  static const String initialRoute = "/";
  static const String dashboard = "/dashboard";
  static const String findDoctor = "/findDoctor";
  static const String viewProfile = "/viewProfile";
  static const String doctorAppointment='/doctor-appointment';
  static const String patientReport='/patient-report';
  static const String medicine='/medicine';
  static const String insurance='/insurance';
  static const String emergency='/emergency';
  static const String healthRecord='/heathRecord';

  static RouteTransitionsBuilder transitionsBuilder = (context, animation, secondaryAnim, child) {
        return ScaleTransition(
          scale: animation,
          child: child
        );
      };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (c, anim, secondaryAnim) => SplashScreen(),
        );
      case dashboard:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (c, anim, secondaryAnim) => DashboardScreen(),
        );
      case viewProfile:
        final arg = settings.arguments as Map<String, dynamic>;
        final String doctorName = arg['doctorName'];
        final String specialization = arg['specialization'];
        final imgUrl = arg['imageUrl'];
        final String appointmentTime = arg['appointmentTime'];
        final String address = arg['address'];
        final double rating = arg['rating'];
        final String exp = arg['exp'];

        return PageRouteBuilder(
          pageBuilder: (c, anim, secondaryAnim) => ViewProfile(
            imageUrl: imgUrl,
            doctorName: doctorName,
            specialization: specialization,
            appointmentTime: appointmentTime,
            address: address,
            rating: rating,
            exp: exp,
          ),
        );
      case insurance:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (c, anim, secondaryAnim) => InsurancePage(),
        );
      case doctorAppointment:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (c, anim, secondaryAnim) => DoctorAppointment(),
        );
      case emergency:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (c, anim, secondaryAnim) => EmergencyScreen(),
        );
      case healthRecord:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (c, anim, secondaryAnim) => HealthRecordScreen(),
        );
      case medicine:
        return PageRouteBuilder(
            transitionsBuilder: transitionsBuilder,
            pageBuilder: (c, anim, secondaryAnim) => MedicineScreen()
        );
      case patientReport:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (c, anim, secondaryAnim) => PatientReport()
        );
      case findDoctor:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (c, anim, secondaryAnim) => FindDoctorScreen()
        );
      default:
        return PageRouteBuilder(
          transitionsBuilder: transitionsBuilder,
          pageBuilder: (c, anim, secondaryAnim) => Scaffold(),
        );
    }
  }
}

extension NavigationExtension on BuildContext {
  Future<void> push(String routeName, {Object? arg}) {
    return Navigator.pushNamed(this, routeName, arguments: arg);
  }

  Future<void> pushReplace(String routeName, {Object? arg}) {
    return Navigator.pushReplacementNamed(this, routeName, arguments: arg);
  }

  Future<void> pushAndRemoveUntil(String routeName, {Object? arg}) {
    return Navigator.pushNamedAndRemoveUntil(this, routeName, (route) => false);
  }

  Future<void> pop() async {
    return Navigator.of(this).pop();
  }
}
