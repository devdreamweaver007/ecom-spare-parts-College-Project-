import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Constents/loader.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/Features/Home/Home_View/ProductDetialView.dart';
import 'package:spareproject/Features/brands/view_model/brand_view_model.dart';

class BrandItemsScreen extends StatefulWidget {
  final int id;
  final String text;
  const BrandItemsScreen({super.key, required this.text, required this.id});

  @override
  State<BrandItemsScreen> createState() => _BrandItemsScreenState();
}

class _BrandItemsScreenState extends State<BrandItemsScreen> {
  @override
  void initState() {
    super.initState();
    final brandViewModel = Provider.of<BrandViewModel>(context, listen: false);
    brandViewModel.getBrandById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final brandViewModel = Provider.of<BrandViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: whiteColor,
        title: Text(
          widget.text,
          style: getFonts(15, Colors.black, FontWeight.bold),
        ),
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: brandViewModel.isLoading
            ? Padding(
                padding: EdgeInsets.only(top: 300),
                child: Center(
                  child: showLoadingSpin(),
                ),
              )
            : Column(
                children: [
                  brandViewModel.brandsById.isEmpty &&
                          brandViewModel.isLoading == false
                      ? Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Center(
                            child: SizedBox(
                                child: Image.asset('noProducts.jpg'.ImagePath)),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: brandViewModel.brandsById.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: .7,
                              crossAxisCount: 2,
                              crossAxisSpacing: 25,
                              mainAxisSpacing: 25,
                            ),
                            itemBuilder: (context, index) {
                              var items = brandViewModel.brandsById[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetialsView(
                                                  id: items.id ?? 0)));
                                },
                                child: FadeInUpBig(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Image.asset(
                'Velo.png'.ImagePath,
                fit: BoxFit.cover,
              );
            },
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset(
               'Velo.png'.ImagePath,
                fit: BoxFit.cover,
              );
            },
          ),
        )
      : Image.asset(
          'Velo.png'.ImagePath,
          fit: BoxFit.cover,
        ),
),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 10),
                                          child: SizedBox(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.1,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                items.partsName ?? "MRF Prethew",
                                                style: getFonts(13, Colors.black,
                                                    FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text("₹ ${items.price}"),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
      ),
    );
  }
}
