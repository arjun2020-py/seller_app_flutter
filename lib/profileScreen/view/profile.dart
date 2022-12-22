// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image_picker/image_picker.dart';

import '../../shredPrefrences/shared_pref.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   requestPermisson();
  // }

  //forground messaging using  firebaseMesaaging
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // var intalizationSettingAndroid =
  //     const AndroidInitializationSettings('@mipmap/ic_launcher');

  // final FlutterLocalNotificationsPlugin flutter_local_notfication_plugin =
  //     FlutterLocalNotificationsPlugin();

  // Future<void> requestPermisson() async {
  //   await messaging.requestPermission(
  //     announcement: true,
  //     carPlay: true,
  //     criticalAlert: true,
  //   );
  //   final InitializationSettings initialization_settings =
  //       InitializationSettings(
  //     android: intalizationSettingAndroid,
  //   );
  //   await flutter_local_notfication_plugin.initialize(initialization_settings,
  //       onDidReceiveNotificationResponse: (details) {});
  // }

  // Future<void> showNotifcation() async {
  //   const andriodPlatfromChaneelSpefices = AndroidNotificationDetails(
  //       'channelId', 'channelName',
  //       channelDescription: 'Decrption');
  //   const platfromChannelSpefices =
  //       NotificationDetails(android: andriodPlatfromChaneelSpefices);
  //   await flutter_local_notfication_plugin.show(
  //       0, 'this is show time', 'your day', platfromChannelSpefices,
  //       payload: 'items');
  // }

  final userRef = FirebaseFirestore.instance.collection("Users");

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //card wrap with stream bilder
          child: StreamBuilder(
              stream: userRef.doc(_auth.currentUser!.uid).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final userData = snapshot.data!;

                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.white54,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.white,
                                        child: (userData['profileImage'] == '')
                                            ? Text(
                                                userData['userName'][0]
                                                    .toString()
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueAccent),
                                              )
                                            : ClipOval(
                                                child: Image.network(
                                                  userData['profileImage']
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                  height: 100,
                                                  width: 100,
                                                ),
                                              )),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    TextButton(
                                        onPressed: getPic,
                                        child: const Text('upload pic'))
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 220),
                                  child: Text(userData['userName'].toString()),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 150),
                                  child: Text(userData['email'].toString()),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: const Icon(Icons.person),
                              title: const Text("Seler Account"),
                              trailing: IconButton(
                                  onPressed: () {
                                    ShredPref().getUserData();
                                  },
                                  icon: const Icon(Icons.navigate_next)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: const Icon(Icons.notes_rounded),
                              title: const Text("Genral Statement"),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.navigate_next)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: const Icon(Icons.help_outline_rounded),
                              title: const Text("Seller Help Center"),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.navigate_next)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: const Icon(Icons.info_outline_rounded),
                              title: const Text("About"),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.navigate_next)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: const Icon(Icons.logout_outlined),
                              title: const Text("Logout"),
                              trailing: IconButton(
                                  onPressed: () {
                                    ShredPref().removeUserData();
                                    Navigator.of(context).pushNamed('Login');
                                  },
                                  icon: const Icon(Icons.navigate_next)),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }

  //get images from mobile
  Future<void> getPic() async {
    final _imagepicker = ImagePicker();
    try {
      final image = await _imagepicker.pickImage(source: ImageSource.gallery);
      await updateProfilePic(image!);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProfilePic(XFile image) async {
    final refernce =
        FirebaseStorage.instance.ref().child('profileImage').child(image.name);
    final file = File(image.path); //assgin local path to file.
    await refernce.putFile(file);
    final imageLink = await refernce.getDownloadURL();

    await userRef
        .doc(_auth.currentUser!.uid)
        .update({'profileImage': imageLink});
    print(imageLink);
  }
}
