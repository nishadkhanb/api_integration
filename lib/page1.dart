import 'dart:io';

import 'package:app_1/controller/controller.dart';
import 'package:app_1/drawerdetails.dart';
import 'package:app_1/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthServices authServices = AuthServices();
  // @override
  // void initState() {
  //   initializeAuth();
  //   super.initState();
  // }

  // initializeAuth() async {
  //   await authServices.checkSignedIn();
  // }

  @override
  File? _image;
  bool _isloading = false;
  Future<void> picimage() async {
    setState(() {
      _isloading = true;
    });
    final picker = await ImagePicker().pickImage(source: ImageSource.gallery);
    // final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _isloading = false;
      if (picker != null) {
        _image = File(picker.path);
      }
    });
    print(_image);
  }

  Future<void> _reqest() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      print("gallery access granted");
    } else if (status.isDenied) {
      print("gallery access denied");
    } else if (status.isPermanentlyDenied) {
      print("permenently denied");
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> details = [
      {'name': 'nishad', 'age': 25},
      {'name': 'abi', 'age': 32},
      {'name': 'ram', 'age': 26}
    ];
    GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();

    // print('Home User name : ${authServices.userName}');

    return Scaffold(
      key: drawerkey,
      appBar: AppBar(
        title: Text('HOME', style: TextStyle(color: Colors.deepOrange)),
        actions: [
          IconButton(
              onPressed: () {
                authServices
                    .setSignOut()
                    .then((value) => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => Splashscreen(),
                        ),
                        (route) => false));
              },
              icon: Icon(Icons.logout)),
          IconButton(
              onPressed: () {
                drawerkey.currentState?.openEndDrawer();
              },
              icon: Icon(Icons.menu))
        ],
      ),
      endDrawer: Drawer(
        child: FutureBuilder(
            future: authServices.checkSignedIn(),
            builder: (context, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        DrawerHeader(
                            child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage: _image != null
                                  ? FileImage(_image!)
                                  : AssetImage("lib/assets/flutter.png")
                                      as ImageProvider,
                              radius: 50,
                              backgroundColor: Colors.blue,
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: IconButton(
                                onPressed: () {
                                  _reqest().then((value) => picimage());
                                },
                                icon: Icon(Icons.edit),
                              ),
                            ),
                            Visibility(
                                visible: _isloading,
                                child: CircularProgressIndicator())
                          ],
                        )),
                        Text(authServices.userName),
                        Expanded(
                          child: ListView.builder(
                            itemCount: details.length,
                            itemBuilder: (context, int index) {
                              return ListTile(
                                title: Text(details[index]['name']),
                                trailing:
                                    Text(details[index]['age'].toString()),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Drawerdetails(
                                          name: details[index]['name'],
                                          age: details[index]['age'])));
                                },
                              );
                            },
                          ),
                        )
                      ],
                    );
            }),
      ),
    );
  }
}
