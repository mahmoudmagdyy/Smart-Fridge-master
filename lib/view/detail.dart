import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_screen/model/meals-model.dart';
import 'package:login_signup_screen/view/shared.dart';

class Detail extends StatelessWidget {
   final Meals ?meals;

  Detail({this.meals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        leading: GestureDetector(
          onTap: ()=>Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.favorite_border,
              color: Colors.green,
            ),
          ),
        ],
      ),
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  buildTextTitleVariation1(meals!.title!),

                  buildTextSubTitleVariation1(meals!.description!),

                ],
              ),
            ),

            SizedBox(
              height: 16,
            ),

            Container(
              height: 310,
              padding: EdgeInsets.only(left: 16),
              child: Stack(
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      buildTextTitleVariation2('Nutritions', false),

                      SizedBox(
                        height: 16,
                      ),

                      buildNutrition(meals!.calories!, "Calories", "Kcal"),

                      SizedBox(
                        height: 16,
                      ),

                      buildNutrition(meals!.carbo!, "Carbo", "g"),

                      SizedBox(
                        height: 16,
                      ),

                      buildNutrition(meals!.protein!, "Protein", "g"),

                    ],
                  ),

                  Positioned(
                    right: -80,
                    child: Hero(
                      tag: "image",
                      child: Container(
                        height: 310,
                        width: 310,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(meals!.image!),
                          backgroundColor: Colors.white,
                          radius: 120,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  buildTextTitleVariation2('Ingredients', false),

                  buildTextSubTitleVariation1(meals!.ingredients!),


                  SizedBox(height: 16,),

                  buildTextTitleVariation2('Recipe preparation', false),

                  buildTextSubTitleVariation1(meals!.directions!),


                ],
              ),
            ),

          ],
        ),
      ),

    );
  }

  Widget buildNutrition(int value, String title, String subTitle) {
    return Container(
      height: 60,
      width: 150,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [kBoxShadow],
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [kBoxShadow],
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color kPrimaryColor = Color(0xFF27AE60);

  BoxShadow kBoxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 8,
    offset: Offset(0, 0),
  );
}
