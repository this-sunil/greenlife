import 'dart:collection';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:greenlife/data/entity/SpecialistModel.dart';
import 'package:greenlife/layer/widget/CustomText.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../../../core/router/AppRoute.dart';
import '../../../../data/entity/DoctorModel.dart';
import '../../../widget/CustomInput.dart';

class FindDoctorScreen extends StatefulWidget {
  const FindDoctorScreen({super.key});

  @override
  State<FindDoctorScreen> createState() => _FindDoctorScreenState();
}

class _FindDoctorScreenState extends State<FindDoctorScreen> {
  late TextEditingController _controller;
  HashSet<String> selectItem = HashSet();

  void multiSelect(String title) {
    selectItem.clear();
    selectItem.add(title);
    setState(() {});
  }

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
  void initState() {
    // TODO: implement initState
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Chip(
              elevation: 10,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.white,
              avatar: Icon(SolarIconsBold.mapPoint, color: Colors.black),
              side: BorderSide(color: Colors.grey.shade300),
              shape: RoundedRectangleBorder(
                side: .none,
                borderRadius: .circular(10),
              ),

              label: Row(
                mainAxisSize: .min,
                children: [
                  Flexible(
                    flex: 5,
                    child: CustomText(
                      title: "Bengaluru",
                      textColor: Colors.black,
                      size: 12,
                      weight: .bold,
                    ),
                  ),
                  Flexible(
                    child: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: CustomText(title: "Find Doctors", size: 20, weight: .bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomText(
              title: "Search,compare and book the best care",
              size: 10,
              textColor: Colors.grey,
            ),
          ),
          Padding(
            padding: .all(10),
            child: CustomInput(
              controller: _controller,
              prefixIcon: Icons.search,
              hintText: "Search doctors,hospitals or symptoms",
            ),
          ),

          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: SpecialListModel.list.length,
              scrollDirection: .horizontal,
              itemBuilder: (context, index) {
                final item = SpecialListModel.list[index];
                return GestureDetector(
                  onTap: () {
                    multiSelect(item.title);
                  },
                  child: SizedBox(
                    width: 100,
                    child: Card(
                      color: selectItem.contains(item.title)
                          ? Colors.green.shade100
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: .circular(10),
                        side: BorderSide(
                          style: .solid,
                          width: 2,
                          color: selectItem.contains(item.title)
                              ? Colors.green
                              : Colors.white,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: .min,
                          mainAxisAlignment: .spaceEvenly,
                          crossAxisAlignment: .center,
                          children: [
                            Flexible(
                              child: Icon(
                                item.imgUrl,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                            Flexible(
                              child: CustomText(
                                title: item.title,
                                size: 10,
                                weight: .bold,
                                textColor: Colors.black,

                                textAlign: .center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: .all(8),
            child: SingleChildScrollView(
              scrollDirection: .horizontal,
              child: Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Chip(
                      backgroundColor: Colors.white,
                      elevation: 10,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        side: .none,
                        borderRadius: .circular(10),
                      ),

                      label: Row(
                        mainAxisSize: .min,
                        mainAxisAlignment: .spaceAround,
                        children: [
                          Flexible(
                            flex: 5,
                            child: CustomText(
                              title: "Gender",
                              textColor: Colors.black,

                              size: 12,
                              weight: .bold,
                            ),
                          ),
                          Flexible(
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Chip(
                      backgroundColor: Colors.white,
                      elevation: 10,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        side: .none,
                        borderRadius: .circular(10),
                      ),

                      label: Row(
                        mainAxisSize: .min,
                        mainAxisAlignment: .spaceAround,
                        children: [
                          Flexible(
                            flex: 5,
                            child: CustomText(
                              title: "Availability",
                              textColor: Colors.black,

                              size: 12,
                              weight: .bold,
                            ),
                          ),
                          Flexible(
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Chip(
                      backgroundColor: Colors.white,
                      elevation: 10,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        side: .none,
                        borderRadius: .circular(10),
                      ),

                      label: Row(
                        mainAxisSize: .min,
                        mainAxisAlignment: .spaceAround,
                        children: [
                          Flexible(
                            flex: 5,
                            child: CustomText(
                              title: "Experience",
                              size: 12,
                              textColor: Colors.black,

                              weight: .bold,
                            ),
                          ),
                          Flexible(
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Chip(
                      backgroundColor: Colors.white,
                      elevation: 10,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        side: .none,
                        borderRadius: .circular(10),
                      ),

                      label: Row(
                        mainAxisSize: .min,
                        mainAxisAlignment: .spaceAround,
                        children: [
                          Flexible(
                            flex: 5,
                            child: CustomText(
                              title: "Rating",
                              size: 12,
                              textColor: Colors.black,
                              weight: .bold,
                            ),
                          ),
                          Flexible(
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
