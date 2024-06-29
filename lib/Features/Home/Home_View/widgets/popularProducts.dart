import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Constents/loader.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/Features/Home/Home_View/ProductDetialView.dart';
import 'package:spareproject/Features/Home/HomeviewModel/home_view_model.dart';

class Popularproducts extends StatefulWidget {
  const Popularproducts({super.key});

  @override
  State<Popularproducts> createState() => _PopularproductsState();
}

class _PopularproductsState extends State<Popularproducts> {
  @override
  Widget build(BuildContext context) {
    final homeviewmodel = Provider.of<HomeViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        homeviewmodel.isLoading
            ? Center(
                child: showLoadingSpin(),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  'Popular products',
                  style: authText(20, blackColor, FontWeight.w600),
                ),
              ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: homeviewmodel.allproducts.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .7,
              crossAxisCount: 2,
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
            ),
            itemBuilder: (context, index) {
              var items = homeviewmodel.allproducts[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetialsView(id: items.id ?? 0)));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: whiteColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        color: Colors.grey,
                        spreadRadius: .2,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * .35,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              topRight: Radius.circular(14)),
                        ),
                        child: items.partImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    topRight: Radius.circular(14)),
                                child: Image.network(
                                  items.partImage ?? "",
                                  fit: BoxFit.contain,
                                ),
                              )
                            : Image.asset(
                                'bike2.png'.ImagePath,
                                fit: BoxFit.contain,
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              items.partsName ?? "MRF Prethew",
                              style:
                                  getFonts(13, Colors.black, FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: RatingBarIndicator(
                            rating: double.parse(items.rating ?? "0.0"),
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 15.0,
                            direction: Axis.horizontal,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text("₹ ${items.price}"),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
