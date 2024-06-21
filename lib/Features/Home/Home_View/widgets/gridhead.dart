import 'package:flutter/material.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/Features/Home/Home_View/vehicle.dart';

class GridHead extends StatefulWidget {
  const GridHead({super.key});

  @override
  State<GridHead> createState() => _GridHeadState();
}

class _GridHeadState extends State<GridHead> {
  List <String> imgs = ['biks.jpg','cars.jpg'];
  List <String> names = ['Bikes Spare parts','Car Spare Parts'];
  List <int> id = [0,1];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
      child: SizedBox(
          height: MediaQuery.of(context).size.width * .45, // height of the image + spacing + text
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(width: MediaQuery.of(context).size.width *.01,);
          },
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: (){
                    id[index];
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> VehiclesScreen(text: names[index], id: id[index])));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: MediaQuery.of(context).size.width * .35,
                    width: MediaQuery.of(context).size.width * .45,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imgs[index].ImagePath,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  names[index],
                  style: getFonts(13, Colors.black, FontWeight.w600),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
