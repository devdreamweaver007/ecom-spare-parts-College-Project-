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
    // TODO: implement initState
    super.initState();
    final proViewModel = Provider.of<ProVieModel>(context, listen: false);
    proViewModel.adresscontroller.text =
        proViewModel.profileList?.addressLine ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final proViewModel = Provider.of<ProVieModel>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adress',
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
                hintText: proViewModel.profileList?.addressLine ?? '',
                hintStyle: authText(16, blackColor, FontWeight.w500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
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
    );
  }
}
