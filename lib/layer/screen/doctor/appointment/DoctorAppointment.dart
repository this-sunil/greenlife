import 'dart:collection';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/router/AppRoute.dart';
import '../../../../data/entity/DoctorModel.dart';
import '../../../widget/CustomText.dart';

class DoctorAppointment extends StatefulWidget {
  const DoctorAppointment({super.key});

  @override
  State<DoctorAppointment> createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {

  HashSet<String> favItem = HashSet();
  void addFav(String title) {
    if (favItem.contains(title)) {
      favItem.remove(title);
    } else {
      favItem.clear();
      favItem.add(title);
    }
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomText(title: "Appointments"),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          padding: .zero,
          scrollDirection: .vertical,
          itemCount: DoctorModel.appointments.length,
          itemBuilder: (context, index) {
            final item = DoctorModel.appointments[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 5,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: .circular(10),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          crossAxisAlignment: .start,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: item.imageUrl,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: .start,
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10.0,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: .start,
                                        mainAxisAlignment: .spaceBetween,
      
                                        children: [
                                          Expanded(
                                            flex: 6,
                                            child: Row(
                                              mainAxisAlignment: .center,
                                              crossAxisAlignment: .start,
      
                                              children: [
                                                Flexible(
                                                  child: CustomText(
                                                    title: item.doctorName,
                                                    size: 14,
                                                    weight: .bold,
      
                                                    textAlign: .start,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
      
                                                Icon(
                                                  SolarIconsBold
                                                      .shieldCheck,
                                                  color: Colors.green,
                                                ),
                                              ],
                                            ),
                                          ),
      
                                          Flexible(
                                            flex: 3,
                                            child: GestureDetector(
                                              onTap: () {
                                                addFav(item.doctorName);
                                              },
                                              child: Icon(
                                                favItem.contains(
                                                  item.doctorName,
                                                )
                                                    ? SolarIconsBold.heart
                                                    : SolarIconsOutline
                                                    .heart,
                                                color:
                                                favItem.contains(
                                                  item.doctorName,
                                                )
                                                    ? Colors.red
                                                    : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    CustomText(
                                      title: item.specialization,
                                      size: 12,
                                      weight: .bold,
                                      textAlign: .center,
                                    ),
                                    CustomText(
                                      title: item.address,
                                      size: 12,
                                      weight: .bold,
                                      textAlign: .center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
      
                      Padding(
                        padding: .symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Wrap(
                              direction: .horizontal,
                              alignment: .center,
                              crossAxisAlignment: .center,
                              children: [
                                Icon(
                                  Icons.star_border,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10),
                                CustomText(
                                  title: "${item.rating}",
                                  weight: .bold,
                                ),
                              ],
                            ),
                            Wrap(
                              direction: .horizontal,
                              alignment: .spaceAround,
                              crossAxisAlignment: .center,
                              runAlignment: .spaceAround,
                              children: [
                                Icon(
                                  SolarIconsOutline.stopwatch,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 10),
                                CustomText(
                                  title: "${item.exp} yrs exp",
                                  weight: .bold,
                                ),
                              ],
                            ),
                            Wrap(
                              direction: .vertical,
                              alignment: .center,
                              crossAxisAlignment: .center,
                              children: [
                                CustomText(title: "Mon-Fri", weight: .bold),
                                CustomText(
                                  title: item.appointmentTime,
                                  weight: .bold,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
      
                      Padding(
                        padding: .all(8),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: .circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  context.push(
                                    AppRoute.viewProfile,
                                    arg: {
                                      'imageUrl': item.imageUrl,
                                      'doctorName': item.doctorName,
                                      'specialization': item.specialization,
                                      'appointmentTime':
                                      item.appointmentTime,
                                      'address': item.address,
                                      'rating': item.rating,
                                      'exp': item.exp,
                                    },
                                  );
                                },
                                child: CustomText(
                                  title: "View Profile",
                                  textColor: Colors.black,
                                  weight: .bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  side: .none,
                                  shape: RoundedRectangleBorder(
                                    side: .none,
                                    borderRadius: .circular(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: CustomText(
                                  title: "Book Now",
                                  weight: .bold,
                                  textColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
    );
  }
}
