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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Center(
              child: Text("Cancle",style: TextStyle(
                color:Color(0xffff0000),fontFamily: 'NunitoSans-Bold',fontSize: 15,
              ),),
            ),
          ),
          title: Center(
              child: Text(
                "Filters",
                style: TextStyle(fontFamily: 'NunitoSans-Bold', color: Colors.black),
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(child: Text("Reset All",style: TextStyle( fontSize: 15, color:Color(0xffff0000),fontFamily: 'NunitoSans-Bold',),)),
            )
          ],
          elevation: 1,
        ),
        body: SingleChildScrollView(child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: title.length,
                    itemBuilder:(context,index){
                      return FilterCard(title: title[index],list: list[index][title[index]],);
                    }),
              )
            ],
          ),
        )),
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: 400,
      height: width * widget.list.length  *0.09,
      child: Column(
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: width * 0.1,bottom: width *0.04,left: 15),
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
          Expanded(
            child: Container(
              child: GridView.builder(
                  itemCount: widget.list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.9,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      height: 100,
                      child: DietaryiteamButton(
                        text: widget.list[index],
                        isSelected: (bool value) {
                          setState(() {

                          });
                        },),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}



