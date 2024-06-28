import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spareproject/Constents/colors.dart';
import 'package:spareproject/Constents/font.dart';
import 'package:spareproject/profile/profileModel/faq_model.dart';

class FaqScreen extends StatefulWidget {
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  List<bool> tappedStates = [];
  List<Items> items = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/jsons/faq.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);

    setState(() {
      if (jsonData['items'] != null) {
        items = (jsonData['items'] as List)
            .map((json) => Items.fromJson(json))
            .toList();
        tappedStates = List<bool>.filled(items.length, false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text("FAQ",style: getFonts(15, Colors.black, FontWeight.bold),),
        titleSpacing: 12,
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: buttonColor,
        onRefresh: ()async{
         await Future.delayed(Duration(seconds: 2));
          setState(() {
           loadJsonData();
          });
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 30,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 12,),
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                         BoxShadow(
                                color: Colors.grey, spreadRadius: 0.1, blurRadius: 2)
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                      tappedStates[index] = !tappedStates[index];
                                    });
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    child: Text(
                                      item.title ?? "",
                                      style: getFonts(12, Colors.black, FontWeight.w700)
                                    ),
                                  ),
                                  Spacer(),
                                  tappedStates[index]
                                      ? Icon(Icons.arrow_drop_down)
                                      : Icon(Icons.arrow_drop_up_outlined)
                                ],
                              ),
                            ),
                            tappedStates[index]
                                ? SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.only(top:6),
                                child: Text(item.description ?? ""),
                              ),
                            )
                                : SizedBox()
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
