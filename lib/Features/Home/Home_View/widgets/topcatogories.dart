import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/Features/Home/Home_View/get_parts_by_category.dart';

class TopCatogiries extends StatefulWidget {
  const TopCatogiries({super.key});

  @override
  State<TopCatogiries> createState() => _TopCatogiriesState();
}

class _TopCatogiriesState extends State<TopCatogiries> {
  List<String> cateogoryImages = [
    'Tyres.png'.ImagePath,
    'Engine.png'.ImagePath,
    'Helmet.png'.ImagePath,
    'Group 26.png'.ImagePath,
    'Seats.png'.ImagePath,
    'light.png'.ImagePath
  ];
  List<String> categoryName = ['Tire', 'Engine', 'Helmet', 'Alloy', 'seat','Lights'];
  List <int> id = [2,3,4,5,6,7];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 1)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Top categories',
              style: authText(20, blackColor, FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: SizedBox(
              height: 100,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 19,
                  );
                },
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: cateogoryImages.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryProductsScreen(text: categoryName[index], id: id[index],)));
                          id[index];
                        },
                        child: FadeInLeft(
                          child: CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                          child: Image.asset(
                            cateogoryImages[index],
                            height: 30,
                            width: 30,
                          ),
                                              ),
                        ),
                      ),
                    SizedBox(height: 6,),
                    FadeInRight(child: Text(categoryName[index]))
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
