import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/profile/profileView/widgets/editprofile.dart';
import 'package:spareproject/profile/profileView/widgets/Adress.dart';
import 'package:spareproject/profile/profileViewModel/proViewModel.dart';

class Profileview extends StatefulWidget {
  const Profileview({super.key});

  @override
  State<Profileview> createState() => _ProfileviewState();
}

List<String> profileitemName = [
  'Edit Profile',
  'Cart',
  'Order',
  'Adress',
  'More',
  'Logout'
];
List<dynamic> profileitemIcon = [
  Icons.person,
  Icons.trolley,
  Icons.location_city,
  Icons.check,
  Icons.more,
  Icons.logout
];

class _ProfileviewState extends State<Profileview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final proviewModel = Provider.of<ProVieModel>(context, listen: false);
    proviewModel.getProfil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          'PROFILE',
          style: authText(24, blackColor, FontWeight.bold),
        ),
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('bgImage.jpg'.ImagePath),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: whiteColor, boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      spreadRadius: .3,
                      offset: Offset(0, -1))
                ]),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: profileitemName.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            switch (index) {
                              case 0:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Editprofile(),
                                    ));
                                break;
                              case 3:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdressView(),
                                    ));
                                break;
                            }
                          },
                          leading: Icon(
                            profileitemIcon[index],
                            size: 25,
                            color: blackColor,
                          ),
                          title: Text(
                            profileitemName[index],
                            style: authText(16, blackColor, FontWeight.w500),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
