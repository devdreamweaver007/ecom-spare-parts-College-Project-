import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/textfield.dart';
import 'package:spareproject/Features/Home/Home_View/widgets/carousilSlider.dart';
import 'package:spareproject/Features/Home/Home_View/widgets/gridhead.dart';
import 'package:spareproject/Features/Home/Home_View/widgets/popularProducts.dart';
import 'package:spareproject/Features/Home/Home_View/widgets/topcatogories.dart';
import 'package:spareproject/Features/Home/HomeviewModel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

TextEditingController homesearchController = TextEditingController();

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    final homeviewmodel = Provider.of<HomeViewModel>(context, listen: false);
    homeviewmodel.getAllProducts();
    homeviewmodel.checkTokenandId();
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
    final homeviewmodel = Provider.of<HomeViewModel>(context, listen: false);
    homeviewmodel.getAllProducts();
    homeviewmodel.checkTokenandId();
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: whiteColor,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          title: searchFieldContainer(homesearchController, 'search Products',
              Icon(Icons.search), context)),
      backgroundColor: whiteColor,
      body: RefreshIndicator(
        backgroundColor: buttonColor,
        color: whiteColor,
         onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              CarousilSliderr(),
              GridHead(),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TopCatogiries(),
              ),
              SizedBox(
                height: 10,
              ),
              Popularproducts()
            ],
          ),
        ),
      ),
    );
  }
}
