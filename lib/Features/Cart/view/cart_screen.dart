import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Constents/loader.dart';
import 'package:spareproject/Extention/extension.dart';
import 'package:spareproject/Features/Address/view/address_screen.dart';
import 'package:spareproject/Features/Cart/ViewModel/cart_view_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool loading = true;
  @override
  void initState() {
    super.initState();
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    cartViewModel.getAllcarts();
    print(cartViewModel.cartItems?.cartItems?.length);
    Timer(Duration(seconds: 2), () {
      setState(() {
        loading = false;
        cartViewModel.getAllcarts();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: whiteColor,
          title: Text(
            "Cart",
            style: getFonts(25, Colors.black, FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: cartViewModel.cartItems?.cartItems == null && loading == true
              ? Padding(
                  padding: const EdgeInsets.only(top: 400),
                  child: Center(
                    child: showLoadingSpin(),
                  ),
                )
              : cartViewModel.cartItems?.totalCartPrice == 0 && loading == false
                  ? Center(
                      child: Image.asset('noProducts.jpg'.ImagePath),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var cart =
                                  cartViewModel.cartItems?.cartItems?[index];
                              int quantity = cart?.quantity ?? 0;
                              dynamic prices =
                                  double.parse(cart?.part?.price ?? "0") *
                                      quantity;
                              void updateQuantity(int quantity) {
                                setState(() {
                                  cart?.quantity = quantity;
                                  print(prices);
                                });
                              }

                              return Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 20, top: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: whiteColor,
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              spreadRadius: .5,
                                              blurRadius: 2)
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 16,
                                          right: 16),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              height: 70,
                                              width: 70,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    cart?.part?.partImage ?? "",
                                                    fit: BoxFit.fill,
                                                  ))),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .1,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .3,
                                                  height: 17,
                                                  child: SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Text(
                                                        cart?.part?.partsName ??
                                                            "MRF PRETHEW",
                                                        style: getFonts(
                                                            12,
                                                            Colors.black,
                                                            FontWeight.w500),
                                                      ))),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text("₹ ${prices}"),
                                              Text(
                                                  "Qty : ${cart?.quantity ?? 0}")
                                            ],
                                          ),
                                          Spacer(),
                                          customAddButton(
                                              icons1: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                              ontapplus: () {
                                                setState(() {
                                                  if (quantity < 5) {
                                                    quantity++;
                                                    updateQuantity(quantity);
                                                    cartViewModel.updatecart(
                                                        quantity,
                                                        cart?.id ?? 0);
                                                  }
                                                });
                                              },
                                              text: (quantity).toString(),
                                              icons2: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                              ontapminus: () {
                                                setState(() {
                                                  if (quantity > 1) {
                                                    quantity--;
                                                    updateQuantity(quantity);
                                                    cartViewModel.updatecart(
                                                        quantity,
                                                        cart?.id ?? 0);
                                                  }
                                                });
                                              })
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: MediaQuery.of(context).size.width *
                                          .01,
                                      right: MediaQuery.of(context).size.width *
                                          .04,
                                      child: InkWell(
                                        onTap: () {
                                          showPopUp(
                                              context,
                                              cart?.part?.partImage ?? "",
                                              cart?.part?.partsName ?? "",
                                              prices.toString(), () {
                                            Navigator.pop(context);
                                            cartViewModel.deletecart(
                                                cart?.id ?? 0, context);
                                          });
                                        },
                                        child: CircleAvatar(
                                          maxRadius: 10,
                                          backgroundColor: Colors.red,
                                          child: Icon(
                                            Icons.close,
                                            color: whiteColor,
                                            size: 10,
                                          ),
                                        ),
                                      )),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 12,
                              );
                            },
                            itemCount:
                                cartViewModel.cartItems?.cartItems?.length ??
                                    0),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .4,
                        )
                      ],
                    ),
        ),
        bottomSheet: cartViewModel.cartItems?.totalCartPrice != 0 &&
                loading == false
            ? Container(
                height: MediaQuery.of(context).size.width * .2,
                decoration: BoxDecoration(color: whiteColor, boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 1),
                      spreadRadius: 1,
                      blurRadius: 2)
                ]),
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Row(
                    children: [
                      Text(
                        "TP: ₹ ${cartViewModel.price ?? "0.0"}",
                        style: getFonts(15, Colors.black, FontWeight.bold),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckoutScreen(
                                        totalPrice: cartViewModel.price,
                                      )));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * .4,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: buttonColor,
                          ),
                          child: Center(
                            child: Text(
                              "Checkout",
                              style:
                                  getFonts(14, Colors.white, FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : null);
  }
}

customAddButton(
    {required Icon icons1,
    required VoidCallback ontapplus,
    required String text,
    required Icon icons2,
    required VoidCallback ontapminus}) {
  return Row(
    children: [
      InkWell(
        onTap: ontapplus,
        child: CircleAvatar(
          backgroundColor: buttonColor,
          minRadius: 10,
          child: icons1,
        ),
      ),
      SizedBox(
        width: 4,
      ),
      Text(text),
      SizedBox(
        width: 4,
      ),
      InkWell(
        onTap: ontapminus,
        child: CircleAvatar(
          backgroundColor: buttonColor,
          minRadius: 10,
          child: icons2,
        ),
      ),
    ],
  );
}

//delete popUp
showPopUp(BuildContext context, String imageurl, String product, String price,
    VoidCallback ontap) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            " Do you want to delete this item?",
            style: getFonts(16, Colors.black, FontWeight.w700),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: 70,
                    width: 70,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageurl,
                          fit: BoxFit.fill,
                        ))),
                SizedBox(
                  height: 10,
                ),
                Text(
                  product,
                  style: getFonts(12, Colors.black, FontWeight.w500),
                ),
                Text(
                  "₹ $price",
                  style: getFonts(12, Colors.black, FontWeight.w500),
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: ontap,
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    height: MediaQuery.of(context).size.width * .1,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: buttonColor,
                    ),
                    child: Center(
                        child: Text(
                      "Confirm",
                      style: getFonts(15, whiteColor, FontWeight.bold),
                    )),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
