import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenlife/core/router/AppRoute.dart';
import 'package:greenlife/core/theme/AppTheme.dart';
import 'package:greenlife/data/entity/CategoryModel.dart';
import 'package:greenlife/layer/widget/CustomText.dart';
import 'package:solar_icons/solar_icons.dart';
import '../../core/Bloc/ThemeBloc/ThemeBloc.dart';
import '../../data/entity/BannerModel.dart';
import '../../data/entity/SpecialistModel.dart';
import '../../data/entity/UpcomingModel.dart';
import '../widget/CustomInput.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;

  String calcTime() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }
  @override
  void initState() {
    // TODO: implement initState
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        titleSpacing: 5,
        centerTitle: false,
        leading: Icon(
          SolarIconsBold.shieldPlus,
          size: 30,
          color: Colors.pinkAccent,
        ),
        title: CustomText(
          title: AppTheme.appName,
          size: 20,
          weight: .bold,
          textAlign: .start,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(SolarIconsOutline.chatRoundCheck)),
          IconButton(onPressed: () {}, icon: Icon(SolarIconsOutline.bell)),
          IconButton(
            onPressed: () {
              context.read<ThemeBloc>().add(SetThemeEvent(isDark: isDark));
            },
            icon: Icon(isDark ? SolarIconsBold.moon : SolarIconsBold.sun),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Padding(
              padding: .only(top: 10, left: 10, right: 10),
              child: CustomText(
                title: "${calcTime()}, Sunil",
                size: 24,
                weight: .bold,
              ),
            ),
            Padding(
              padding: .only(left: 10, right: 10),
              child: CustomText(
                title: "We're here to care for you and your family",
                size: 10,
                textColor: Colors.grey,
                weight: .bold,
              ),
            ),

            Padding(
              padding: .all(10),
              child: CustomInput(
                controller: searchController,
                prefixIcon: Icons.search,
                suffixIcon: Icons.mic,
                hintText: "Search doctors,hospitals or symptoms",
              ),
            ),

            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: BannerModel.bannerModel.length,
                scrollDirection: .horizontal,
                itemBuilder: (context, index) {
                  final item = BannerModel.bannerModel[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: CachedNetworkImage(
                                  imageUrl: item.imgUrl,
                                  fit: BoxFit.cover,
                                  maxWidthDiskCache: 400,
                                  maxHeightDiskCache: 400,

                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),

                                  errorWidget: (context, url, error) =>
                                      const Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          color: Colors.grey,
                                        ),
                                      ),
                                ),
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.black.withOpacity(0.7),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),

                              Positioned(
                                top: 60,
                                left: 15,
                                child: CustomText(
                                  title: item.title,
                                  size: 16,
                                  textColor: Colors.white,
                                ),
                              ),

                              Positioned(
                                top: 80,
                                left: 15,
                                child: CustomText(
                                  title: item.subtitle,
                                  size: 14,
                                  textColor: Colors.white70,
                                ),
                              ),

                              Positioned(
                                left: 15,
                                bottom: 10,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: item.btnColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: CustomText(
                                    title: item.btnTitle,
                                    size: 16,
                                    textColor: Colors.white,
                                  ),
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
              padding: .all(4),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: .zero,
                itemCount: CategoryModel.list.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  final item = CategoryModel.list[index];
                  return GestureDetector(
                    onTap: (){
                      switch(index){
                        case 0:
                          context.push(AppRoute.doctorAppointment);
                          break;
                        case 1:
                          context.push(AppRoute.findDoctor);
                          break;
                        case 2:
                          context.push(AppRoute.patientReport);
                          break;
                        case 3:
                          context.push(AppRoute.medicine);
                          break;
                        case 4:
                          context.push(AppRoute.insurance);
                          break;
                        case 5:
                          context.push(AppRoute.emergency);
                          break;
                        case 6:
                          context.push(AppRoute.healthRecord);
                          break;
                        default:
                          break;
                      }
                    },
                    child: Card(
                      color: item.color.withValues(alpha: 3),
                      elevation: 8,
                      margin: .all(5),
                      shadowColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: .spaceEvenly,
                          crossAxisAlignment: .center,
                          mainAxisSize: .min,
                          children: [
                            Flexible(
                              child: Icon(
                                item.imgUrl,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            Flexible(
                              child: CustomText(
                                title: item.title,
                                size: 10,
                                weight: .bold,
                                textAlign: .center,
                                textColor: Colors.white,
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
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: 'Upcoming Appointment',
                          weight: FontWeight.bold,
                          size: 16,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: CustomText(
                            title: 'View All',
                            textColor: Colors.green,
                            weight: FontWeight.bold,
                            size: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                      itemCount: UpcomingAppointment.appointments.length,
                      padding: .zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final item=UpcomingAppointment.appointments[index];
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: .spaceEvenly,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          item.imageUrl,
                                      width: 100,
                                      height: 100,

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: .spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: CustomText(
                                              title: item.appointmentTime,
                                              size: 10,

                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: CustomText(
                                              title:item.doctorName,
                                              size: 14,
                                              weight: .bold,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: CustomText(
                                              title: item.specialization,
                                              size: 10,
                                              textColor: Colors.grey,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: CustomText(
                                              title:
                                                  item.address,
                                              size: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  IconButton(onPressed: (){}, icon: Card(
                                      elevation: 0,
                                      shape: CircleBorder(side: BorderSide(color: Colors.grey.shade300)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.keyboard_arrow_right),
                                      )))
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
            ),

            Padding(
              padding: .all(4),
              child: Column(
                mainAxisSize: .min,
                children: [
                  Padding(
                    padding: .all(4),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        CustomText(
                          title: 'Top Specialities',
                          weight: .bold,
                          size: 16,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: CustomText(
                            title: 'View All',
                            textColor: Colors.green,
                            weight: .bold,
                            size: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: .zero,
                    itemCount: SpecialListModel.list.length-1,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) {
                      final item = SpecialListModel.list[index+1];
                      return Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .center,
                        mainAxisSize: .min,
                        children: [
                          Flexible(
                            child: CircleAvatar(
                              maxRadius: 25,
                              backgroundColor: item.color,

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  item.imgUrl,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                title: item.title,
                                size: 10,
                                weight: .bold,
                                textAlign: .center,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
