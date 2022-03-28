import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_hero/screen/dietary_preferences/dietary_iteam_button.dart';

List title=['Category','Cuisine','Main Ingredient','Difficult','Time','Dietary Needs'];
List category=['Appetizer','Drink','BreakFast','Lunch','Dinner','Dessert'];
List cuisine=['Chines','French','Greek','Indian','Italian','Japanese','Korean','Lebanese','Mediterranean','Mexican','Middle Eastern','Moroccan','Thai','Turkish','Vietnamese'];
List mainIngredient=['Beef','Pork','Poultry','Seafood','Vegetables'];
List difficult=['Beginner','Intermediate','Advance'];
List time=['< 15 min','< 30 min','< 60 min'];
List dietary=['Alcohol Free' ,'Egg Free','Fish Free','Gluten Free','Lactose Free','Peanut Free','Pork Free','Shellfesh ','Sog Free','Sugar Free','Tree Nut Free','Vegan','Vegetarian','Vegetarian'];

class FiltersScreen extends StatefulWidget {

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
   List list=[{'Category':category,},{'Cuisine':cuisine},{'Main Ingredient':mainIngredient},{"Difficult":difficult}
     ,{'Time':time},{"Dietary Needs":dietary}];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: ()=>Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Center(
                child: Text("Cancle",style: TextStyle(
                  color:Color(0xffff0000),fontFamily: 'NunitoSans-Bold',fontSize: 15,
                ),),
              ),
            ),
          ),
          title: Center(
              child: Text(
                "Filters",
                style: TextStyle(fontFamily: 'NunitoSans-Bold', color: Colors.black),
              )),
          actions: [
            InkWell(
              onTap: ()=>Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Center(child: Text("Reset All",style: TextStyle( fontSize: 15, color:Color(0xffff0000),fontFamily: 'NunitoSans-Bold',),)),
              ),
            )
          ],
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: title.length,
                      itemBuilder:(context,index){
                        return FilterCard(title: title[index],list: list[index][title[index]],);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FilterCard extends StatefulWidget {
  FilterCard({this.title,this.list,});
  final title;
  final list;


  @override
  State<FilterCard> createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment:MainAxisAlignment.start,
          children: [
            Container(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "NunitoSans-SemiBold",
                ),
              ),
            ),
          ],
        ),
        Container(
          child: GridView.builder(
            shrinkWrap: true,
              itemCount: widget.list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.9,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2),
              itemBuilder: (context, index) {
                return Container(
                  child: DietaryiteamButton(
                    text: widget.list[index],
                    isSelected: (bool value) {
                      setState(() {

                      });
                    },),
                );
              }),
        ),
      ],
    );
  }
}



