import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_screen/db/api-content-fridge.dart';

import 'package:login_signup_screen/db/api-suggest-meals.dart';
import 'package:login_signup_screen/model/content-fridge-model.dart';

import 'package:login_signup_screen/model/suggestMeals-model.dart';

class HomeFridge extends StatefulWidget {
  HomeFridge({Key? key}) : super(key: key);

  @override
  State<HomeFridge> createState() => _HomeFridgeState();
}

class _HomeFridgeState extends State<HomeFridge> {
  late Future<List<Content>> futureContent;
  @override
  void initState() {
    super.initState();
    futureContent = fetchContent();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Contents"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Content>>(
          future: fetchContent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [kBoxShadow],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 160,
                        width: 160,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 110,
                            backgroundImage: NetworkImage("${snapshot.data![index].image}"),
                          ),

                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Text(
                                  "${snapshot.data![index].name}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: Container(
                                  child: Text(
                                    "${snapshot.data![index].shelf}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey[500],

                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${snapshot.data![index].type}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    "${snapshot.data![index].quantity} g",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      );

  }

  Widget buildPopular() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [kBoxShadow],
      ),
      child: Row(
        children: [
          Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/welcome.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Name Of Item",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "Shelf Location ",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "20 kg",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxShadow kBoxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 8,
    offset: Offset(0, 0),
  );
}
