import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/profile/profileViewModel/proViewModel.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

final ImagePicker _imagePicker = ImagePicker();
File? _image;
String? token;
int? id;

class _EditprofileState extends State<Editprofile> {
  Future<void> pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    final proviewmodel = Provider.of<ProVieModel>(context, listen: false);
    proviewmodel.getProfil();
    proviewmodel.emailcontroller.text = proviewmodel.profileList?.email ?? "";
    proviewmodel.namecontroller.text = proviewmodel.profileList?.name ?? "";
    proviewmodel.adresscontroller.text =
        proviewmodel.profileList?.addressLine ?? "";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final proViewmodel = Provider.of<ProVieModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          'Edit Profile',
          style: authText(16, blackColor, FontWeight.bold),
        ),
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    height: 110,
                    child: Stack(children: [
                      CircleAvatar(
                        maxRadius: 55,
                        backgroundImage: _image == null &&
                                proViewmodel.profileList?.profileImage == null
                            ? AssetImage('profile.png'.ImagePath)
                            : _image == null &&
                                    proViewmodel.profileList?.profileImage !=
                                        null
                                ? NetworkImage(
                                    proViewmodel.profileList?.profileImage ??
                                        "")
                                : FileImage(_image!),
                      ),
                      Positioned(
                          bottom: 5,
                          right: 0,
                          child: IconButton(
                              onPressed: pickImage,
                              icon: Icon(
                                Icons.add_a_photo,
                                color: blackColor,
                              )))
                    ])),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Name',
                  style: authText(16, blackColor, FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: proViewmodel.namecontroller,
                  decoration: InputDecoration(
                      label: Text(
                        'Name',
                        style: authText(14, Colors.black, FontWeight.w300),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Email',
                  style: authText(16, blackColor, FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: proViewmodel.emailcontroller,
                  decoration: InputDecoration(
                      label: Text("Email"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Adress',
                  style: authText(16, blackColor, FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: TextField(
                  maxLines: 7,
                  controller: proViewmodel.adresscontroller,
                  decoration: InputDecoration(
                    label: Text("Address"),
                    hintText: 'Enter Your Address\n eg :- Yourname \n your address(house name etc) \n post \n pin \n Landmark.etc ',
                    hintStyle: authText(16, Colors.grey, FontWeight.w500),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                   proViewmodel.editProfile(
                          profileImage: _image,
                          context: context,
                          name: proViewmodel.namecontroller.text,
                          email: proViewmodel.emailcontroller.text,
                          adress: proViewmodel.adresscontroller.text);
                  },
                  child: Container(
                    height: size.height * 0.056,
                    width: size.width * 0.67,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(size.width * 0.03),
                    ),
                    child: Center(
                      child: Text(
                        'Save Changes',
                        style: authText(14, whiteColor, FontWeight.bold),
                      ),
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
