import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Features/Authentication/AuthViewModel/authViewModel.dart';
import 'package:spareproject/profile/profileViewModel/proViewModel.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

final ImagePicker _imagePicker = ImagePicker();
File? _image;
TextEditingController namcontroller = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController adressController = TextEditingController();

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
    // TODO: implement initState
    super.initState();
    final proviewmodel = Provider.of<ProVieModel>(context, listen: false);
    proviewmodel.getProfil();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<Authviewmodel>(context);
    final size = MediaQuery.of(context).size;
    final proViewmodel = Provider.of<ProVieModel>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                      )),
                ),
                SizedBox(
                  width: 90,
                ),
                Text(
                  'Edit Profile',
                  style: authText(24, blackColor, FontWeight.bold),
                ),
              ],
            ),
            Center(
              child: Container(
                  height: 110,
                  child: Stack(children: [
                    CircleAvatar(
                      radius: 45,
                    ),
                    Positioned(
                        bottom: 10,
                        right: 0.5,
                        child: IconButton(
                            onPressed: pickImage,
                            icon: Icon(Icons.add_a_photo)))
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
                controller: namcontroller,
                decoration: InputDecoration(
                    label: Text(
                      proViewmodel.profileList?.name ?? '',
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
                controller: emailController,
                decoration: InputDecoration(
                    label: Text(
                      authViewModel.emailcontroller.text,
                      style: authText(14, Colors.grey, FontWeight.w300),
                    ),
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
                controller: adressController,
                decoration: InputDecoration(
                  hintText: proViewmodel.profileList?.addressLine ?? '',
                  hintStyle: authText(16, blackColor, FontWeight.w500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 40.0, horizontal: 12.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  proViewmodel.editProfile(
                      name: namcontroller.text,
                      email: emailController.text,
                      adress: adressController.text);
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
                      style: authText(
                          size.width * 0.035, whiteColor, FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
