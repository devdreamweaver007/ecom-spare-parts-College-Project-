import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Constents/loader.dart';
import 'package:spareproject/Features/Home/HomeviewModel/home_view_model.dart';
import 'package:spareproject/Features/brands/view/brands_item_screen.dart';

class AllBrandsScreen extends StatefulWidget {
  const AllBrandsScreen({super.key});

  @override
  State<AllBrandsScreen> createState() => _AllBrandsScreenState();
}

class _AllBrandsScreenState extends State<AllBrandsScreen> {
  @override
  void initState() {
    super.initState();
    final brandsViewModel = Provider.of<HomeViewModel>(context, listen: false);
    brandsViewModel.getAllBrands();
  }

  @override
  Widget build(BuildContext context) {
    final brandsViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: whiteColor,
        title: Text("BRANDS",style: getFonts(25, Colors.black, FontWeight.w600),),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
           brandsViewModel.allBrands.isEmpty &&  brandsViewModel.isLoading ?
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Center(
                child: showLoadingSpin(),
              ),
            ):
            SizedBox(height: 20,),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Set the number of columns here
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 2, // Adjust the aspect ratio as needed
              ),
              itemCount: brandsViewModel.allBrands.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final brands = brandsViewModel.allBrands[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> BrandItemsScreen(text: brands.vehicleBrand??"", id: brands.id ?? 0)));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: whiteColor,
                      
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              brands.brandLogo ?? "",
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.width * .2,
                              width: MediaQuery.of(context).size.width * .2,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            brands.vehicleBrand ?? "",
                            style: getFonts(15, Colors.black, FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
