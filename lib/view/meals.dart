import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_screen/db/api-content-fridge.dart';
import 'package:login_signup_screen/db/api-meals.dart';

import 'package:login_signup_screen/db/api-suggest-meals.dart';
import 'package:login_signup_screen/model/content-fridge-model.dart';
import 'package:login_signup_screen/model/meals-model.dart';

import 'package:login_signup_screen/model/suggestMeals-model.dart';
import 'package:login_signup_screen/view/detail.dart';
import 'package:login_signup_screen/view/shared.dart';

class Recips extends StatefulWidget {
  Recips({Key? key, required this.meals}) : super(key: key);
  final Meals meals;

  @override
  State<Recips> createState() => _RecipsState();
}

class _RecipsState extends State<Recips> {
  late Future<List<Meals>> futureMeals;

  @override
  void initState() {
    super.initState();
    futureMeals = fetchMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals"),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Meals>>(
          future: fetchMeals(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () => Get.to(Detail(
                      meals: Meals(
                    title: snapshot.data![index].title,
                    ingredients: snapshot.data![index].ingredients,
                    directions: snapshot.data![index].directions,
                    details: snapshot.data![index].details,
                    calories: snapshot.data![index].calories,
                    carbo: snapshot.data![index].carbo,
                    protein:snapshot.data![index].protein ,
                    image: snapshot.data![index].image,
                    description: snapshot.data![index].description,
                  ))),
                  child: Container(
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
                            backgroundColor: Colors.black,
                            radius: 120,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 110,
                              backgroundImage: NetworkImage(
                                  "${snapshot.data![index].image}"),
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
                                buildRecipeTitle(
                                    "${snapshot.data![index].title}"),
                                buildRecipeSubTitle(
                                    "${snapshot.data![index].description}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //         SingleChildScrollView(
                //           physics: BouncingScrollPhysics(),
                //           child: Column(
                //               children: [
                //
                //           Padding(
                //           padding: EdgeInsets.symmetric(horizontal: 16),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //
                //               buildTextTitleVariation1('Springy Salads'),
                //
                //               buildTextSubTitleVariation1(
                //                   'Healthy and nutritious food recipes'),
                //
                //               SizedBox(
                //                 height: 32,
                //               ),
                //
                //               SizedBox(
                //                 height: 16,
                //               ),
                //
                //
                //               Container(
                //                 height: 160,
                //                 width: 160,
                //                 child: PageView(
                //                   physics: BouncingScrollPhysics(),
                //                   children: buildPopular(),
                //                 ),
                //               ),
                //
                //             ],
                //           ),
                //         ),
                //     ]
                //   ),
                // ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  // Widget buildPopular() {
  //   return Container(
  //     margin: EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(20),
  //       ),
  //       boxShadow: [kBoxShadow],
  //     ),
  //     child: Row(
  //       children: [
  //
  //         Container(
  //           height: 160,
  //           width: 160,
  //           decoration: BoxDecoration(
  //             image: DecorationImage(
  //               image: NetworkImage("${meals.image}"),
  //               fit: BoxFit.fitHeight,
  //             ),
  //           ),
  //         ),
  //
  //         Expanded(
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 16),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //
  //                 buildRecipeTitle("${meals.title}"),
  //
  //                 buildRecipeSubTitle("${meals.description}"),
  //
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //
  //                     buildCalories( "25 Kcal"),
  //
  //                     Icon(
  //                       Icons.favorite_border,
  //                     )
  //
  //                   ],
  //                 ),
  //
  //               ],
  //             ),
  //           ),
  //         ),
  //
  //       ],
  //     ),
  //   );
  // }

  BoxShadow kBoxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 8,
    offset: Offset(0, 0),
  );
}
