import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Constents/loader.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/Features/Home/Home_View/ProductDetialView.dart';
import 'package:spareproject/Features/Home/HomeviewModel/home_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String search = "";
  @override
  Widget build(BuildContext context) {
    final searchViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: MediaQuery.of(context).size.width * .3,
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Text("Search Products")
              ],
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    searchViewModel.searchedresults.clear();
                  }
                  searchViewModel.searchedresults.clear();
                  search = value;
                  searchViewModel.getSearchResults(value);
                });
              },
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
      body: searchViewModel.isLoading
          ? Center(
              child: showLoadingSpin(),
            )
          : search.isEmpty
              ? Center(
                  child: Text("Please Search products"),
                )
              : search.isNotEmpty &&
                      searchViewModel.searchedresults.isEmpty &&
                      searchViewModel.isLoading == false
                  ? Center(
                      child: Image.asset('noProducts.jpg'.ImagePath),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: searchViewModel.searchedresults.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: .7,
                                crossAxisCount: 2,
                                crossAxisSpacing: 25,
                                mainAxisSpacing: 25,
                              ),
                              itemBuilder: (context, index) {
                                var items =
                                    searchViewModel.searchedresults[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetialsView(
                                                    id: items.id ?? 0)));
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .35,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(14),
                                                topRight: Radius.circular(14)),
                                          ),
                                          child: items.partImage != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  14),
                                                          topRight:
                                                              Radius.circular(
                                                                  14)),
                                                  child: Image.network(
                                                    items.partImage ?? "",
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : Image.asset(
                                                  'bike2.png'.ImagePath,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                          ),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                items.partsName ??
                                                    "Name",
                                                style: getFonts(
                                                    13,
                                                    Colors.black,
                                                    FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10),
                                            child: RatingBarIndicator(
                                              rating: double.parse(
                                                  items.productRating ?? "0.0"),
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 15.0,
                                              direction: Axis.horizontal,
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 10),
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
                            height: 20,
                          )
                        ],
                      ),
                    ),
    );
  }
}
