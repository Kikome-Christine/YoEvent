import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_event/ReusableWidget/colors.dart';
import 'package:real_event/controller/data_controller.dart';
import 'package:real_event/model/ticket_model.dart';

import 'package:real_event/ReusableWidget/my_widget.dart';
import 'package:real_event/views/bottom_nav_bar/message_screen.dart';

class ProfileScreen1 extends StatefulWidget {
  @override
  _ProfileScreen1State createState() => _ProfileScreen1State();
}

class _ProfileScreen1State extends State<ProfileScreen1> {
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();



  bool isNotEditable = true;

  DataController? dataController;

  int? followers = 0, following = 0;
  String image = '';

  @override
  initState() {
    super.initState();
    dataController = Get.find<DataController>();

    //firstNameController.text = dataController!.myDocument!.get('first');
    //lastNameController.text = dataController!.myDocument!.get('last');
    try {
  if (dataController!.myDocument != null) {
    firstNameController.text = dataController!.myDocument!.get('first') ?? '';
    lastNameController.text = dataController!.myDocument!.get('last') ?? '';
    descriptionController.text = dataController!.myDocument!.get('desc') ?? '';
    image = dataController!.myDocument!.get('image') ?? '';
    locationController.text = dataController!.myDocument!.get('location') ?? '';

    followers = dataController!.myDocument!.get('followers')?.length ?? 0;
    following = dataController!.myDocument!.get('following')?.length ?? 0;
  }
} catch (e) {
  // Handle any exceptions or errors that might occur
}
try {
  if (dataController!.myDocument != null) {
    image = dataController!.myDocument!.get('image') ?? '';
    locationController.text = dataController!.myDocument!.get('location') ?? '';

    var followersList = dataController!.myDocument!.get('followers');
    followers = (followersList is List) ? followersList.length : 0;

    var followingList = dataController!.myDocument!.get('following');
    following = (followingList is List) ? followingList.length : 0;
  }
} catch (e) {
  print("An error occurred while fetching data: $e");
  image = '';
  locationController.text = '';
  followers = 0;
  following = 0;
}
  }
 @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 100,
                  margin: EdgeInsets.only(
                      left: Get.width * 0.75, top: 20, right: 20),
                  alignment: Alignment.topRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          MessageScreen();
                         },
                        child: Image(
                          image: AssetImage('assets/sms.png'),
                          width: 28,
                          height: 25,
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/menu.png'),
                        width: 23.33,
                        height: 19,
                      ),
                    ],
                  ),
                ),
              ),
            
              Align(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 90, horizontal: 20),
                  width: Get.width,
                  height: isNotEditable ? 240 : 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.only(top: 35),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(70),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff7DDCFB),
                              Color(0xffBC67F2),
                              Color(0xffACF6AF),
                              Color(0xffF95549),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(70),
                              ),
                              child: image.isEmpty
                                  ? CircleAvatar(
                                      radius: 56,
                                      backgroundColor: Colors.white,
                                      backgroundImage:  NetworkImage(image
                                      ),)
                                  : CircleAvatar(
                                      radius: 56,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                        image,
                                      )),
                              // child: Image.asset(
                              //   'assets/profilepic.png',
                              //   fit: BoxFit.contain,
                              // ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    isNotEditable
                        ? Text(
                            "${firstNameController.text} ${lastNameController.text}",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : Container(
                            width: Get.width * 0.6,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: firstNameController,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: 'First Name',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: lastNameController,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: 'Last Name',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    isNotEditable
                        ? Text(
                            "${locationController.text}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff918F8F),
                            ),
                          )
                        : Container(
                            width: Get.width * 0.6,
                            child: TextField(
                              controller: locationController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Location',
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 15,
                    ),
                    isNotEditable
                        ? Container(
                            width: 270,
                            child: Text(
                              '${descriptionController.text}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                letterSpacing: -0.3,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          )
                        : Container(
                            width: Get.width * 0.6,
                            child: TextField(
                              controller: descriptionController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Description',
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "${followers}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.3,
                                ),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(
                                  fontSize: 13,
                                  letterSpacing: -0.3,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 35,
                            color: Color(0xff918F8F).withOpacity(0.5),
                          ),
                          Column(
                            children: [
                              Text(
                                "${following}",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.3),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(
                                  fontSize: 13,
                                  letterSpacing: -0.3,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: screenwidth * 0.25,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  backgroundColor: AppColors.blue),
                              onPressed: () {},
                              child: Text(
                                'Follow',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                     

                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              width: 53,
                              height: 53,
                              child: Image.asset(
                                'assets/Group 26.png',
                              ),
                            ),
                            // Container(
                            //   margin: EdgeInsets.only(left: 15),
                            //   width: 53,
                            //   height: 53,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(36),
                            //     color: Colors.white,
                            //   ),
                            //   // child: Image(
                            //   //     image: AssetImage('assets/Ellipse 984.png')),
                            // ),
                            // Container(
                            //   margin: EdgeInsets.only(left: 15),
                            //   width: 53,
                            //   height: 53,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(36),
                            //     color: Colors.white,
                            //   ),
                            // //   child: Image(
                            // //       image: AssetImage('assets/Ellipse 985.png')),
                            // ),
                            // Container(
                            //   margin: EdgeInsets.only(left: 15),
                            //   width: 53,
                            //   height: 53,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(36),
                            //     color: Colors.white,
                            //   ),
                            //   // child: Image(
                              //     image: AssetImage('assets/Ellipse 986.png')),
                            //),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30, top: 10),
                          child: Text(
                            'NEW',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                    width: 0.01,
                                  ),
                                ),
                              ),
                              child: TabBar(
                                indicatorColor: Colors.black,
                                labelPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 10,
                                ),
                                unselectedLabelColor: Colors.black,
                                tabs: [
                                  Tab(
                                    icon: Image.asset("assets/ticket.png"),
                                    height: 20,
                                  ),
                                  Tab(
                                    icon: Image.asset("assets/Group 18600.png"),
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: screenheight * 0.46,
                              //height of TabBarView
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                    width: 0.5,
                                  ),
                                ),
                              ),
                              child: TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      //itemCount: ticket.length,
                                      itemBuilder: (context, index) {
                                        return
                                            InkWell(onTap: (){
                                            Get.to(()=> ProfileScreen1());
                                            },
                                            
                                        );
                                      }),
                                  Container(
                                    child: Center(
                                      child: Text('Tab 2',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.only(top: 105, right: 35),
                  child: InkWell(
                    onTap: () {
                      if (isNotEditable == false) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set({
            'first': firstNameController.text,
            'last': lastNameController.text,
            'location': locationController.text,
            'desc': descriptionController.text
          }, SetOptions(merge: true)).then((value) {
            Get.snackbar('Profile Updated',
                'Profile has been updated successfully.',
                colorText: Colors.white,
                backgroundColor: Colors.blue);});
                       
                      }

                      setState(() {
                        isNotEditable = !isNotEditable;
                      });
                    },
                    child: isNotEditable
                        ? Image(
                            image: AssetImage('assets/edit.png'),
                            width: screenwidth * 0.04,
                          )
                        : Icon(
                            Icons.check,
                            color: Colors.black,
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

   