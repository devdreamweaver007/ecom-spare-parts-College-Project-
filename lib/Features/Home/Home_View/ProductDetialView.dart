import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Constents/loader.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/Features/Home/HomeviewModel/home_view_model.dart';

class ProductDetialsView extends StatefulWidget {
  final int id;
  const ProductDetialsView({super.key, required this.id});

  @override
  State<ProductDetialsView> createState() => _ProductDetialsViewState();
}

class _ProductDetialsViewState extends State<ProductDetialsView> {
  @override
  void initState() {
    super.initState();
    getrating();
   
  }

  void getrating (){
   final getproductViewModel =
        Provider.of<HomeViewModel>(context, listen: false);
    getproductViewModel.getProductsById(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final getproductViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child:
        getproductViewModel.isLoading ?
        Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Center(
            child: showLoadingSpin(),
          ),
        ): 
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width  * .8,
                child: getproductViewModel.getProducts?.partImage != null
                    ? Image.network(
                        getproductViewModel.getProducts?.partImage ?? "" ,fit: BoxFit.contain,)
                    : Image.asset("product1.png".ImagePath)),
            Padding(
              padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
              child: SizedBox(
                child: Text(
                  getproductViewModel.getProducts?.partsName ?? "",
                  style: authText(16, blackColor, FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: RatingBar.builder(
                itemCount: 5,
                allowHalfRating: true,
                initialRating: double.parse(getproductViewModel.getProducts?.productrating ?? "0.0"),
                itemSize: 24,
                minRating: 1,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'HighLights',
                style: authText(20, blackColor, FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Container(
                child: Text(getproductViewModel.getProducts?.description ?? ""),
              ),
            ),
          ],
        ),
      ),
      bottomSheet:!getproductViewModel.isLoading? Container(
        decoration: BoxDecoration(color: whiteColor, boxShadow: [
          BoxShadow(blurRadius: 1, color: Colors.grey, spreadRadius: 1)
        ]),
        child: BottomAppBar(
          color: whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹ ${getproductViewModel.getProducts?.price ?? 0}",
                style: authText(24, blackColor, FontWeight.w700),
              ),
              InkWell(
                onTap: (){
                  print("hi");
                  getproductViewModel.addTocart(getproductViewModel.getProducts?.id ?? 0,context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(12)),
                  width: 137,
                  height: 40,
                  child: Center(
                    child: Text(
                      'Buy Now',
                      style: otpFont(14, whiteColor, FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ) : null
    );
  }
}
