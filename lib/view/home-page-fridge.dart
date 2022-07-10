import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_screen/controller/authcontroller.dart';
import 'package:login_signup_screen/model/meals-model.dart';
import 'package:login_signup_screen/view/analysis.dart';
import 'package:login_signup_screen/view/contents-page.dart';
import 'package:login_signup_screen/view/meals.dart';
import 'package:login_signup_screen/view/suggestion-meals.dart';
import 'package:login_signup_screen/view/updateItem.dart';
import 'package:login_signup_screen/view/welcomepage.dart';

class FirstPage extends StatelessWidget {
   FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: SafeArea(
        child:GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            buildRecipe("assets/fridge.png","Contents",()=>Get.to(HomeFridge())),
            buildRecipe("assets/chef.png","Recipes",()=>Get.to(Recips(meals: Meals()))),
            buildRecipe("assets/statistics.png","Analysis",()=>Get.to(Analysis())),
            buildRecipe("assets/cooking.png","Suggestion Recipes",()=>Get.to(SuggestionMeals())),

          ],
        )
        
      ),
      drawer: Drawer(
        child:Column(
          children: [
            AppBar(title: Text("Hello Friend !"),automaticallyImplyLeading: false,),
            ListTile(
              leading:Icon(Icons.exit_to_app) ,
              title: Text("Logout",style: TextStyle(fontSize: 18),),
              onTap:()=>Get.to(HomePage()),
            ),
            ListTile(
              leading:Icon(Icons.update_outlined) ,
              title: Text("UpdateItem",style: TextStyle(fontSize: 18),),
              onTap:()=>Get.to(UpdateItem())
            ),
          ],
        ),

      ),
    );
  }

  Widget buildRecipe(image ,name ,onTap){
    return GestureDetector(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        margin: EdgeInsets.only(right: 16, left:16 , bottom: 16, top: 8),
        padding: EdgeInsets.all(16),
        width: 180,
        height: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              child: Hero(
                tag: 'image',
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 8,
            ),

            Text(
              name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),


          ],
        ),
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
