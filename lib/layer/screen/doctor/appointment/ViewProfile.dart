import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar_plus/flutter_rating_bar_plus.dart';
import 'package:greenlife/core/router/AppRoute.dart';
import 'package:greenlife/data/entity/SpecialistModel.dart';
import 'package:greenlife/layer/widget/CustomText.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../data/entity/ReviewModel.dart';

class ViewProfile extends StatefulWidget {
  final String doctorName;
  final String specialization;
  final String appointmentTime;
  final String address;
  final double rating;
  final String imageUrl;
  final String exp;
  const ViewProfile({
    super.key,
    required this.doctorName,
    required this.specialization,
    required this.appointmentTime,
    required this.address,
    required this.rating,
    required this.imageUrl,
    required this.exp,
  });

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  HashSet<String> selectItem = HashSet();
  List<String> time = [
    "09:00 AM",
    "10:45 AM",
    "11:00 AM",
    "01:45 PM",
    "03:40 PM",
    "05:00 PM",
    "06:00 PM",
  ];
  void selectTime(String time) {
    if (selectItem.contains(time)) {
      selectItem.remove(time);
    } else {
      selectItem.clear();
      selectItem.add(time);
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScroll) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
                ),
              ),

              elevation: 0,

              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: .cover,
                            image: NetworkImage(widget.imageUrl),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(SolarIconsOutline.share, color: Colors.black),
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,

                    child: Icon(SolarIconsOutline.heart, color: Colors.black),
                  ),
                ),
              ],
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: .end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          CustomText(
                            title: widget.doctorName,
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(width: 10),
                          Icon(SolarIconsBold.shieldCheck, color: Colors.green),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          const Icon(
                            SolarIconsOutline.medicalKit,
                            size: 16,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: CustomText(
                              title: widget.specialization,

                              textColor: Colors.grey.shade700,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          const Icon(
                            SolarIconsOutline.mapPoint,
                            size: 16,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: CustomText(
                              title: widget.address,

                              textColor: Colors.grey.shade600,
                              size: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: CustomText(
                              title: "Available Today",

                              textColor: Colors.green.shade700,
                              weight: FontWeight.w600,
                              size: 12,
                            ),
                          ),
                          const Spacer(),
                          CustomText(title: widget.appointmentTime),
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.shade300),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Icon(
                                  SolarIconsBold.medalRibbonStar,
                                  color: Colors.blue,
                                ),
                                CustomText(
                                  title: "Experience",
                                  size: 12,
                                  textColor: Colors.grey,
                                  weight: .bold,
                                ),
                                CustomText(
                                  title: widget.exp,
                                  size: 12,
                                  weight: .bold,
                                ),
                              ],
                            ),
                          ),

                          Flexible(
                            child: Column(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Icon(
                                  SolarIconsBold.meditation,
                                  color: Colors.blue,
                                ),
                                CustomText(
                                  title: "Patient",
                                  size: 12,
                                  textColor: Colors.grey,
                                  weight: .bold,
                                  textAlign: .center,
                                ),
                                CustomText(
                                  title: widget.exp,
                                  size: 12,
                                  weight: .bold,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Icon(
                                  Icons.star_border_outlined,
                                  color: Colors.blue,
                                ),
                                CustomText(
                                  title: "Reviews",
                                  size: 12,
                                  textColor: Colors.grey,
                                  weight: .bold,
                                ),
                                CustomText(
                                  title: widget.exp,
                                  size: 12,
                                  weight: .bold,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Icon(
                                  SolarIconsBold.calendarMark,
                                  color: Colors.blue,
                                ),
                                CustomText(
                                  title: "Availability",
                                  size: 12,
                                  textColor: Colors.grey,
                                  weight: .bold,
                                ),
                                CustomText(
                                  title: "Mon-Fri",
                                  size: 12,
                                  weight: .bold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      title: "Expertize",
                      size: 16,
                      textAlign: .start,
                      weight: .bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      direction: .horizontal,
                      children: List.generate(
                        SpecialListModel.list.length - 1,
                            (index) {
                          final item = SpecialListModel.list[index + 1];

                          return Chip(
                            side: BorderSide.none,
                            backgroundColor: Colors.green.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: Padding(
                              padding: const .all(4),
                              child: CustomText(
                                title: item.title.toString(),
                                size: 12,
                                weight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      title: "Available Tomorrow",
                      size: 16,
                      textAlign: .start,
                      weight: .bold,
                    ),
                  ),
                  Padding(
                    padding: .all(2),
                    child: SingleChildScrollView(
                      scrollDirection: .horizontal,
                      child: Row(
                        children: List.generate(time.length, (index) {
                          final item = time[index];
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: selectItem.contains(item)
                                    ? Color(0xff38863e)
                                    : Colors.white,
                                side: BorderSide(color: Colors.grey.shade300),
                                shape: RoundedRectangleBorder(
                                  borderRadius: .circular(10),
                                ),
                              ),
                              onPressed: () {
                                selectTime(item);
                              },
                              child: CustomText(
                                title: item,
                                textColor: selectItem.contains(item)
                                    ? Colors.white
                                    : Colors.black,
                                weight: .bold,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomText(
                      title: "Reviews",
                      size: 16,
                      weight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                  ),

                  // Patient reviews list
                  ListView.builder(
                    shrinkWrap: true,
                    padding: .zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ReviewModel.reviews.length, // replace with your reviews.length
                    itemBuilder: (context, index) {
                      final item=ReviewModel.reviews[index];
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: .circular(10),
                            side: BorderSide(color: Colors.green.shade200,width: 1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: .spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: CircleAvatar(backgroundImage: NetworkImage(item.photo.toString())),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment: .start,
                                          children: [
                                            CustomText(title: item.name,size: 16,weight: .bold),
                                            CustomText(
                                              title: item.timeAgo,
                                              size: 12,
                                              weight: .bold,
                                              textColor: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ),
                                      RatingBar.builder(
                                        initialRating: item.rating,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20, // smaller stars
                                        itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1.0,
                                        ),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(color: Colors.grey.shade300),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(
                                    mainAxisAlignment:.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CustomText(
                                            title: item.comment,
                                            size: 12,
                                            textAlign: .justify,

                                            weight: .w500,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.green.shade200,
                                            borderRadius: .circular(10),
                                          ),
                                          child: Center(
                                            child: Icon(Icons.format_quote,color: Colors.indigo,size: 18),
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
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      title: "Consultation Fee",
                      size: 15,
                      weight: FontWeight.bold,
                      textColor: Colors.black,
                    ),
                    CustomText(title: "₹ 1000",textColor: Colors.black,size: 14),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Color(0xff38863e),
                    ),
                    onPressed: () {},
                    child: CustomText(
                      title: "Book Appointment",
                      size: 12,
                      textColor: Colors.white,
                      weight: .bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
