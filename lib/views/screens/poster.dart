import 'dart:io';
import 'dart:ui';
import 'package:fetstival_app/modals/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import '../../utils/lists.dart';
import 'package:path_provider/path_provider.dart';

class poster extends StatefulWidget {
  const poster({Key? key}) : super(key: key);

  @override
  State<poster> createState() => _posterState();
}

class _posterState extends State<poster> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    GlobalKey imageKey = GlobalKey();
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                RenderRepaintBoundary bountry = imageKey.currentContext!
                    .findRenderObject() as RenderRepaintBoundary;
                var img = await bountry.toImage(
                  pixelRatio: 5,
                );
                var bit = await img.toByteData(format: ImageByteFormat.png);
                var uList = bit!.buffer.asUint8List();

                print(".................................");
                print(uList.toString());
                print(".................................");

                if (uList != null) {
                  Directory dir = await getApplicationDocumentsDirectory();

                  DateTime d = DateTime.now();
                  File file = await File(
                          "${dir.path}/FA${d.year}${d.month}${d.day}${d.hour}${d.minute}${d.second}.png")
                      .create();
                  await file.writeAsBytes(uList);

                  print(".................................");

                  print("Image path: ${file.path}");
                  print(".................................");

                  Share.shareXFiles([XFile(file.path)]);
                }
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: RepaintBoundary(
            key: imageKey,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(5, 5),
                    blurRadius: 3,
                    spreadRadius: 1.7,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        MyLists.imageUrlList[index]['img'],
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: MemoryImage(
                                File(MyGlobalVariables.business_image!.path)
                                    .readAsBytesSync(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 336,
                        child: Row(
                          children: [
                            Icon(Icons.location_on),
                            Text(
                              MyGlobalVariables.address!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 339,
                        left: 223,
                        right: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.email,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              MyGlobalVariables.email!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 310,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Color(0xffE1306C),
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  MyGlobalVariables.instagram!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.lightBlue,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  MyGlobalVariables.facebook!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.blue,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  MyGlobalVariables.twitter!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  MyGlobalVariables.website!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 255,
                        child: Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.teal,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              MyGlobalVariables.phone_no.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 2,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment(0, -0.5),
                          child: Text(
                            MyGlobalVariables.business_name!,
                            style: TextStyle(fontFamily: 'rv', fontSize: 30),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 34,
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment(0, -0.5),
                          child: Text(
                            MyGlobalVariables.business_category.toString(),
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xffEFF6ED),
    );
  }
}
