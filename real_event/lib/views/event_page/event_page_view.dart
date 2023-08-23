import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_event/ReusableWidget/colors.dart';
import 'package:real_event/controller/data_controller.dart';

import '../check_out/check_out_screen.dart';
import '../invite_guest/invite_guest_screen.dart';

class EventPageView extends StatefulWidget {
  DocumentSnapshot eventData, user;

  EventPageView(this.eventData, this.user, {super.key});

  @override
  _EventPageViewState createState() => _EventPageViewState();
}

class _EventPageViewState extends State<EventPageView> {
  DataController dataController = Get.find<DataController>();

  List eventSavedByUsers = [];
  
  get userLikes =>  [];
  
  get comments =>  [];

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('events')
                  .doc(widget.eventData.id)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                
                DocumentSnapshot eventData = snapshot.data!;
                
                 

                 String image = widget.user.get('image') ?? '';
              if (widget.user.data() is Map<String, dynamic>) {
                Map<String, dynamic> userMap =
                    widget.user.data() as Map<String, dynamic>;
                image = userMap.containsKey('image') ? userMap['image'] : '';
              }


              String eventImage = '';
              if (eventData.data() is Map<String, dynamic>) {
                Map<String, dynamic> eventDataMap =
                    eventData.data() as Map<String, dynamic>;

                if (eventDataMap.containsKey('media')) {
                  List media = eventDataMap['media'] as List;
                  Map mediaItem = media.firstWhere(
                    (element) => element['isImage'] == true,
                    orElse: () => {'url': ''},
                  );
                  eventImage = mediaItem['url'];
                }
              }

              List joinedUsers = [];
              if (eventData.data() is Map<String, dynamic>) {
                Map<String, dynamic> eventDataMap =
                    eventData.data() as Map<String, dynamic>;

                joinedUsers = eventDataMap.containsKey('joined')
                    ? eventDataMap['joined']
                    : [];
              }

              String tagsCollectively = '';
              if (eventData.data() is Map<String, dynamic>) {
                Map<String, dynamic> eventDataMap =
                    eventData.data() as Map<String, dynamic>;

                if (eventDataMap.containsKey('tags')) {
                  List tags = eventDataMap['tags'] as List;
                  tags.forEach((e) {
                    tagsCollectively += '#$e ';
                  });
                }
              }

              int likes = 0;
              List userLikes = [];
              int comments = 0;
              List eventSavedByUsers = [];

              if (eventData.data() is Map<String, dynamic>) {
                Map<String, dynamic> eventDataMap =
                    eventData.data() as Map<String, dynamic>;

                likes = eventDataMap.containsKey('likes')
                    ? eventDataMap['likes'].length
                    : 0;

                userLikes = eventDataMap.containsKey('likes')
                    ? eventDataMap['likes']
                    : [];

                comments = eventDataMap.containsKey('comments')
                    ? eventDataMap['comments'].length
                    : 0;

                eventSavedByUsers = eventDataMap.containsKey('saves')
                    ? eventDataMap['saves']
                    : [];
              }


                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Navigate back to the previous view
                  },
                   
                      child: Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          'assets/Header.png',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            image,
                          ),
                          radius: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.user.get('first')} ${widget.user.get('last')}',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                             

                             
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                              color: const Color(0xffEEEEEE),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Text(
                                '${widget.eventData.get('event')}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: const Color(0xff0000FF), width: 1.5),
                          ),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Text(
                            '${widget.eventData.get('start_time')}',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                         
                        Text(
                          "${widget.eventData.get('event_name')}",
                          style: TextStyle(
                              fontSize: 18,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "${widget.eventData.get('date')}",
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/location.png',
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${widget.eventData.get('location')}',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 190,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(eventImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: Get.width * 0.6,
                            height: 50,
                            child: ListView.builder(
                              itemBuilder: (ctx, index) {
                                DocumentSnapshot user = dataController.allUsers
                                    .firstWhere(
                                        (e) => e.id == joinedUsers[index]);

                                String image = '';

                                try {
                                  image = user.get('image');
                                } catch (e) {
                                  image = '';
                                }

                                return Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: CircleAvatar(
                                    minRadius: 13,
                                    backgroundImage: NetworkImage(image),
                                  ),
                                );
                              },
                              itemCount: joinedUsers.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Shs${widget.eventData.get('price')}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              
                              Text(
                                "${widget.eventData.get('max_entries')} spots left!",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: widget.eventData.get('description'),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ])),
                    const SizedBox(
                      height: 20,
                    ),

                     
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const Inviteguest());
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: Colors.blue.withOpacity(0.9)),
                              child: const Center(
                                child: Text(
                                  "invite Friends",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.off(() => CheckOutView(widget.eventData));
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 0.1,
                                      blurRadius: 60,
                                      offset: const Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(13)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: const Center(
                                child: Text(
                                  'Join',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            tagsCollectively,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            if (userLikes.contains(
                                FirebaseAuth.instance.currentUser!.uid)) {
                              FirebaseFirestore.instance
                                  .collection('events')
                                  .doc(eventData!.id)
                                  .set({
                                'likes': FieldValue.arrayRemove(
                                    [FirebaseAuth.instance.currentUser!.uid]),
                              }, SetOptions(merge: true));
                            } else {
                              FirebaseFirestore.instance
                                  .collection('events')
                                  .doc(eventData!.id)
                                  .set({
                                'likes': FieldValue.arrayUnion(
                                    [FirebaseAuth.instance.currentUser!.uid]),
                              }, SetOptions(merge: true));
                            }
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xffD24698).withOpacity(0.02),
                                )
                              ],
                            ),
                            child: Icon(
                              Icons.favorite,
                              size: 14,
                              color: userLikes.contains(
                                      FirebaseAuth.instance.currentUser!.uid)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          likes.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/message.png',
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          comments.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/send.png',
                          height: 16,
                          width: 16,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            if (eventSavedByUsers.contains(
                                FirebaseAuth.instance.currentUser!.uid)) {
                              FirebaseFirestore.instance
                                  .collection('events')
                                  .doc( eventData.id)
                                  .set({
                                'saves': FieldValue.arrayRemove(
                                    [FirebaseAuth.instance.currentUser!.uid])
                              }, SetOptions(merge: true));

                              eventSavedByUsers.remove(
                                  FirebaseAuth.instance.currentUser!.uid);
                              setState(() {});
                            } else {
                              FirebaseFirestore.instance
                                  .collection('events')
                                  .doc( eventData.id)
                                  .set({
                                'saves': FieldValue.arrayUnion(
                                    [FirebaseAuth.instance.currentUser!.uid])
                              }, SetOptions(merge: true));
                              eventSavedByUsers
                                  .add(FirebaseAuth.instance.currentUser!.uid);
                              setState(() {});
                            }
                          },
                          child: Image.asset(
                            'assets/boomMark.png',
                            height: 16,
                            width: 16,
                            color: eventSavedByUsers.contains(
                                    FirebaseAuth.instance.currentUser!.uid)
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
