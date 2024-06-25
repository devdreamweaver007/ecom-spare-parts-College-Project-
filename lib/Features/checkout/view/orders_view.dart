import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Features/Cart/ViewModel/cart_view_model.dart';
import 'package:spareproject/Features/checkout/ViewModel/checkout_viewmodel.dart';

class MyordersScreen extends StatefulWidget {
  const MyordersScreen({super.key});

  @override
  State<MyordersScreen> createState() => _MyordersScreenState();
}

class _MyordersScreenState extends State<MyordersScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    final orderViewModel = Provider.of<CheckoutViewModel>(context, listen: false);
    cartViewModel.getAllcarts();
    orderViewModel.getAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    final orderViewModel = Provider.of<CheckoutViewModel>(context);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          'My Orders',
          style: authText(16, blackColor, FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: orderViewModel.myorders?.orders?.length ?? 0,
              itemBuilder: (context, index) {
                var items = orderViewModel.myorders?.orders?[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 2)
                      ],
                    ),
                    child: Row(
                      children: [
                        if (items?.part?.partImage != null)
                          SizedBox(
                            height: MediaQuery.of(context).size.width *.2,
                            width: MediaQuery.of(context).size.width *.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                items?.part?.partImage ?? "",
                                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                              ),
                            ),
                          )
                        else
                          Icon(Icons.image_not_supported),
                          SizedBox(width: MediaQuery.of(context).size.width * .05 ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(items?.part?.partsName ?? "No Name",style: getFonts(12, Colors.black, FontWeight.w500),),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text("price : ",style: getFonts(12, Colors.black, FontWeight.w500),),
                                  Text("₹ ",style: getFonts(16, Colors.green, FontWeight.bold),),
                                  Text(items?.part?.price ?? "No Name",style: getFonts(12, Colors.black, FontWeight.w500),),
                                ],
                              ),
                             SizedBox(height: 10,),
                              Text("QTY : ${items?.quantity}",style: getFonts(12, Colors.black, FontWeight.w500),),
                              SizedBox(height: 10,),
                              Row(children: [
                              Text("STATUS : ",style: getFonts(13, Colors.black, FontWeight.w500)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.orange
                                ),
                                child: Padding(padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                                child: Text("In Progress",style: getFonts(10, Colors.white, FontWeight.bold),) ,
                                ),
                              )
                              ],)
                            ],
                          ),
                          Spacer(),
                          Text("Details",style: getFonts(11, Colors.blue, FontWeight.bold),),
                          Icon(Icons.arrow_forward_ios,color: Colors.blue,size: 15,)
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
