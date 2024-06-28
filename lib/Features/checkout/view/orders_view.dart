import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/Features/Cart/ViewModel/cart_view_model.dart';
import 'package:spareproject/Features/checkout/ViewModel/checkout_viewmodel.dart';
import 'package:spareproject/Features/checkout/view/order_tracker_screen.dart';

class MyordersScreen extends StatefulWidget {
  const MyordersScreen({super.key});

  @override
  State<MyordersScreen> createState() => _MyordersScreenState();
}

class _MyordersScreenState extends State<MyordersScreen> {
  bool _isPlacedSelected = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
    final orderViewModel =
        Provider.of<CheckoutViewModel>(context, listen: false);
    cartViewModel.getAllcarts();
    orderViewModel.getAllOrders();
  }

  @override
  Widget build(BuildContext context) {
    final orderViewModel = Provider.of<CheckoutViewModel>(context);
    List<dynamic> placedOrders = orderViewModel.myorders?.orders?.where((order) => order.currentStatus != 'Delivered').toList() ?? [];
    List<dynamic> deliveredOrders = orderViewModel.myorders?.orders?.where((order) => order.currentStatus == 'Delivered').toList() ?? [];

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: whiteColor,
        title: Text(
          'My Orders',
          style: authText(16, blackColor, FontWeight.bold),
        ),
      ),
      body:Column(
  children: [
    ToggleButtons(
      splashColor: Colors.indigo,
      borderWidth: 2,
      borderRadius: BorderRadius.circular(8),  // Color of the border when the button is selected
      borderColor: Colors.transparent,          // Color of the border when the button is not selected
      selectedColor: Colors.white,       // Color of the text/icon when the button is selected
      color: Colors.black,               // Color of the text/icon when the button is not selected
      fillColor: buttonColor,            // Background color of the button when it is selected
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 46.0),
          child: Text('In Progress', style: segmentFont(14, FontWeight.w700)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 46.0),
          child: Text('Delivered', style: segmentFont(14, FontWeight.w700)),
        ),
      ],
      isSelected: [_isPlacedSelected, !_isPlacedSelected],
      onPressed: (int index) {
        setState(() {
          _isPlacedSelected = index == 0;
        });
      },
    ),
    SizedBox(height: 30,),
    Expanded(
      child: _isPlacedSelected ? _buildOrderList(placedOrders, context) : _buildOrderList(deliveredOrders, context),
    ),
  ],
),
    );
  }

  Widget _buildOrderList(List<dynamic> orders, BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        var items = orders[index];
        Color getColor() {
          if (items?.currentStatus == "Placed") {
            return Colors.orange;
          } else if (items?.currentStatus == "Shipped") {
            return Colors.blue;
          } else {
            return Colors.green;
          }
        }
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrdertrackerScreen(status: items?.currentStatus ?? ""),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20,bottom: 12),
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
                      height: MediaQuery.of(context).size.width * .2,
                      width: MediaQuery.of(context).size.width * .2,
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
                  SizedBox(width: MediaQuery.of(context).size.width * .05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items?.part?.partsName ?? "No Name",
                        style: getFonts(12, Colors.black, FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "price : ",
                            style: getFonts(12, Colors.black, FontWeight.w500),
                          ),
                          Text(
                            "₹ ",
                            style: getFonts(16, Colors.green, FontWeight.bold),
                          ),
                          Text(
                            items?.part?.price ?? "No Name",
                            style: getFonts(12, Colors.black, FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "QTY : ${items?.quantity}",
                        style: getFonts(12, Colors.black, FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "STATUS : ",
                            style: getFonts(13, Colors.black, FontWeight.w500),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: getColor(),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                              child: Text(
                                items?.currentStatus ?? "",
                                style: getFonts(10, Colors.white, FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    "Details",
                    style: getFonts(11, Colors.blue, FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
