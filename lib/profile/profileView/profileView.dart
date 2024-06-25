import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/Features/Cart/view/cart_screen.dart';
import 'package:spareproject/Features/checkout/view/orders_view.dart';
import 'package:spareproject/profile/profileView/widgets/Address.dart';
import 'package:spareproject/profile/profileView/widgets/editprofile.dart';
import 'package:spareproject/profile/profileView/widgets/logout_popup.dart';
import 'package:spareproject/profile/profileViewModel/proViewModel.dart';
import 'package:spareproject/sharedPrefrences/sharedPreferences.dart';

class Profileview extends StatefulWidget {
  const Profileview({super.key});

  @override
  State<Profileview> createState() => _ProfileviewState();
}

List<String> profileitemName = [
  'Edit Profile',
  'Cart',
  'My Orders',
  'Address',
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
    super.initState();
    final proviewModel = Provider.of<ProVieModel>(context, listen: false);
    proviewModel.getProfil();
  }

  @override
  Widget build(BuildContext context) {
    final proviewModel = Provider.of<ProVieModel>(context,);
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
  radius: 60,
  backgroundColor: authColor,
  child: CircleAvatar(
    radius: 55,
    child: ClipOval(
      child: proviewModel.profileList?.profileImage != null
          ? Image.network(
              proviewModel.profileList?.profileImage ?? "",
              fit: BoxFit.cover,
              width: 110,
              height: 110,
            )
          : Image.asset(
              'profile.png'.ImagePath,
              fit: BoxFit.cover,
              width: 110,
              height: 110,
            ),
    ),
  ),
),

              SizedBox(height: 10,),
              Center(
                child: Text(proviewModel.namecontroller.text ?? "User",style: getFonts(15, Colors.black, FontWeight.w700),),
              ),
              SizedBox(
                height: 50,
              ),
             Container(
  width: MediaQuery.of(context).size.width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
    color: whiteColor,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        blurRadius: 4,
        spreadRadius: 0.3,
        offset: Offset(0, -6),
      )
    ],
  ),
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
                                case 5:
                                logoutPopUp(context, (){
                                  removeToken(context: context);
                                });
                                break;
                                case 2:
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyordersScreen()));
                                break;
                                case 1:
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
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
