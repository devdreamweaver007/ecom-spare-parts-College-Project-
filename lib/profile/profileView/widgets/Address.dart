import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/profile/profileViewModel/proViewModel.dart';

class AdressView extends StatefulWidget {
  const AdressView({super.key});

  @override
  State<AdressView> createState() => _AdressViewState();
}

class _AdressViewState extends State<AdressView> {
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
    final proViewModel = Provider.of<ProVieModel>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Address',
          style: authText(16, blackColor, FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: TextField(
              maxLines: 7,
              controller: proViewModel.adresscontroller,
              decoration: InputDecoration(
                hintText: 'Enter Your Address\n eg :- Yourname \n your address(house name etc) \n post \n pin \n Landmark.etc ',
                hintStyle: authText(16, Colors.grey, FontWeight.w500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(height: 50,),
          Center(
            child: InkWell(
              onTap: () {
                proViewModel.editProfile(
                    context: context,
                    name: proViewModel.namecontroller.text,
                    email: proViewModel.emailcontroller.text,
                    adress: proViewModel.adresscontroller.text);
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
                    'Save',
                    style: authText(
                        16, whiteColor, FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
