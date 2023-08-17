import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_event/controller/data_controller.dart';
import 'package:real_event/widgets/custom_app_bar.dart';
import 'package:real_event/widgets/events_feed_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataController dataController = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     backgroundColor: AppColors.AppBarColor,
      //     centerTitle: true,
      //     title: Text(
      //       "Welcome to RealEvent App",
      //       style: TextStyle(fontSize: 20),
      //     )),
      backgroundColor: Colors.black.withOpacity(0.03),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),

                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: Text(
                      "Hey! Welcome to YoEvent App, a home of Hapiness!",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                // HomePage(), //Updated
                SizedBox(
                  height: Get.height * 0.02,
                ),
                // EventsFeed(),
                Obx(() => dataController.isUsersLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : EventsIJoined())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
