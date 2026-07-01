import 'package:flutter/material.dart';
import 'package:greenlife/layer/pages/AppointmentPage.dart';

import 'package:greenlife/layer/pages/HealthPage.dart';
import 'package:greenlife/layer/pages/HomePage.dart';
import 'package:greenlife/layer/pages/ProfilePage.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../core/service/FirebaseSetup.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex=0;
  List<Widget> page=[];
  late Widget currentPage;
  @override
  void initState() {
    // TODO: implement initState
    page=[HomePage(),AppointmentPage(),HealthPage(),ProfilePage()];
    currentPage=page[currentIndex];

    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(

      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
          showUnselectedLabels: true,

          type: .shifting,
          selectedItemColor: isDark?Colors.cyanAccent:Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (index){
            setState(() {
              currentIndex=index;
              currentPage=page[currentIndex];
            });
          },
          items: [

            BottomNavigationBarItem(icon: Icon(SolarIconsOutline.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(SolarIconsOutline.calendar),label: "Appointment"),
            BottomNavigationBarItem(icon: Icon(SolarIconsOutline.health),label: "Health"),
            BottomNavigationBarItem(icon: Icon(SolarIconsOutline.userCircle),label: "Profile"),
          ]),
      floatingActionButton: FloatingActionButton(onPressed: () async{
       // await FirebaseSetup.instance.showNotification("Welcome Sunil","Take care of your fitness");
       await FirebaseSetup.instance.sendOTP("+918668796251");
      },child: Icon(Icons.notification_add,color: Colors.black)),
    );
  }
}
