import 'dart:io';

import 'package:fetstival_app/modals/globals.dart';
import 'package:fetstival_app/utils/lists.dart';
import 'package:fetstival_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../componets/mysnekbar.dart';

class add_info extends StatefulWidget {
  const add_info({Key? key}) : super(key: key);

  @override
  State<add_info> createState() => _add_infoState();
}

class _add_infoState extends State<add_info> {
  ImagePicker picker = ImagePicker();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              formKey.currentState!.reset();
              MyGlobalVariables.email = MyGlobalVariables.website =
                  MyGlobalVariables.business_category = MyGlobalVariables
                          .business_name =
                      MyGlobalVariables.instagram = MyGlobalVariables.twitter =
                          MyGlobalVariables.facebook = MyGlobalVariables.address =
                              MyGlobalVariables.phone_no =
                                  MyGlobalVariables.business_image = null;
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(
                () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      mySnackBar(
                        text: "Successfully Create !!",
                        color: Colors.green,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      mySnackBar(
                        text: "Failled!!",
                        color: Colors.red,
                      ),
                    );
                  }
                },
              );
              Navigator.of(context)
                  .pushNamed(MyRoutes.poster, arguments: index);
            },
            icon: Icon(
              Icons.done,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: formKey,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(18),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 55,
                            child: Text(
                              "Add",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black),
                            ),
                            backgroundColor: Colors.grey.shade400,
                            foregroundImage: (MyGlobalVariables
                                        .business_image !=
                                    null)
                                ? FileImage(MyGlobalVariables.business_image!)
                                : null,
                          ),
                          FloatingActionButton.small(
                            backgroundColor: Colors.white,
                            shape: CircleBorder(),
                            elevation: 15,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text("Select The Method!!"),
                                        actions: [
                                          TextButton.icon(
                                            onPressed: () async {
                                              Navigator.of(context).pop();

                                              XFile? img =
                                                  await picker.pickImage(
                                                      source:
                                                          ImageSource.camera);

                                              if (img != null) {
                                                setState(() {
                                                  MyGlobalVariables
                                                          .business_image =
                                                      File(img.path);
                                                });
                                              }
                                            },
                                            label: const Text("Camera"),
                                            icon: const Icon(Icons.camera_alt),
                                          ),
                                          TextButton.icon(
                                            onPressed: () async {
                                              Navigator.of(context).pop();

                                              XFile? img =
                                                  await picker.pickImage(
                                                      source:
                                                          ImageSource.gallery);

                                              if (img != null) {
                                                setState(() {
                                                  MyGlobalVariables
                                                          .business_image =
                                                      File(img.path);
                                                });
                                              }
                                            },
                                            icon: Icon(Icons.photo_library),
                                            label: Text("Galary"),
                                          ),
                                        ],
                                      ));
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Upload Your business logo",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.business_center,
                        size: 45,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "select business category",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      PopupMenuButton(
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: Colors.black,
                        ),
                        itemBuilder: (context) {
                          return MyLists.businessCategories
                              .map(
                                (e) => PopupMenuItem(
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          MyGlobalVariables.business_category =
                                              e;
                                          print(MyGlobalVariables
                                              .business_category);
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        e,
                                      )),
                                ),
                              )
                              .toList();
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.business,
                        size: 45,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextFormField(
                          textAlign: TextAlign.start,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          initialValue: MyGlobalVariables.business_name,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter The business name!!";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (val) {
                            MyGlobalVariables.business_name = val;
                          },
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Enter Your Business Name",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.call,
                        size: 45,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextFormField(
                        maxLength: 10,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        initialValue: (MyGlobalVariables.phone_no == null)
                            ? null
                            : MyGlobalVariables.phone_no.toString(),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Mobile Number!!";
                          } else if (val!.length < 10) {
                            return "Contact number must have 10 digits...";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          MyGlobalVariables.phone_no = int.parse(val!);
                        },
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: "Enter Your Phone Name",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 45,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextFormField(
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black),
                        initialValue: MyGlobalVariables.address,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter The Address!!";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          MyGlobalVariables.address = val;
                        },
                        decoration: InputDecoration(
                          hintText: "Address",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email,
                        size: 45,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        initialValue: MyGlobalVariables.email,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter The email id!!";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          MyGlobalVariables.email = val;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Your Email ID",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.language,
                        size: 45,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        initialValue: MyGlobalVariables.website,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter The Website!!";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          MyGlobalVariables.website = val;
                        },
                        decoration: InputDecoration(
                          hintText: "Website",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Social Media",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Color(0xffE1306C),
                        size: 45,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        initialValue: MyGlobalVariables.instagram,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Instagram ID Name!!";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          MyGlobalVariables.instagram = val;
                        },
                        decoration: InputDecoration(
                          hintText: "Instagram",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.lightBlue,
                        size: 45,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        initialValue: MyGlobalVariables.facebook,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Facebook ID Name!!";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          MyGlobalVariables.facebook = val;
                        },
                        decoration: InputDecoration(
                          hintText: "Facebook",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Colors.blue,
                        size: 45,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        initialValue: MyGlobalVariables.twitter,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Twitter ID Name!!";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          MyGlobalVariables.twitter = val;
                        },
                        decoration: InputDecoration(
                          hintText: "Twitter",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                      ))
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
