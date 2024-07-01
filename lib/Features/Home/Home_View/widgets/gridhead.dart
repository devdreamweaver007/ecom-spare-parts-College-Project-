import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Features/Home/Home_View/vehicle.dart';

class GridHead extends StatelessWidget {
  const GridHead({super.key});

  Widget _buildItem(String img, String name, int itemId, BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VehiclesScreen(text: name, id: itemId)));
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
                img,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(
          name,
          style: getFonts(13, Colors.black, FontWeight.w600),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
      child: SizedBox(
        height: MediaQuery.of(context).size.width * .45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInLeftBig(child: _buildItem('assets/Images/biks.jpg', 'Bikes Spare parts', 0, context)),
            FadeInRightBig(child: _buildItem('assets/Images/cars.jpg', 'Car Spare Parts', 1, context)),
          ],
        ),
      ),
    );
  }
}
