import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe_hero/provider_model/provider_model.dart';
import 'package:recipe_hero/screen/favorites/recipe_screen.dart';
import 'package:recipe_hero/screen/ingrediants/available_recipe_screen.dart';
import 'package:recipe_hero/screen/ingrediants/search_field.dart';
import 'package:recipe_hero/screen/favorites/favorite_screen.dart';

import 'button.dart';
import 'ingredent_item_button.dart';

class Ingredients extends StatefulWidget {
  const Ingredients({Key? key}) : super(key: key);

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return SafeArea(child:Consumer<AddIngredientList>(
      builder: (context,addingredients,child){
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: width,
            height: height,
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: width * 0.1,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Add Ingredient",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'NunitoSans-Bold',color: Colors.black),),
                  ],),
                ),
                SearchField(onchange: (value){print(value);},),
                SizedBox(height: 5,),
                Container(

                  child: (addingredients.selectedIngredient.length==0)?Container(
                      height: width * 0.12,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02,vertical:  width * 0.02),
                      child: Text('Please select one or more ingredient to view a recipe',style: TextStyle(fontSize: 12,color: Colors.grey,fontFamily: 'NunitoSans-SemiBold'),)):Container(
                      height: width * 0.15,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                        itemCount: addingredients.selectedIngredient.length,
                        itemBuilder: (context, index) {
                           return
                             SelectedItem(text: addingredients.selectedIngredient[index],onTap: (){
                             addingredients.removeitem(addingredients.selectedIngredient[index]);
                             print(addingredients.selectedIngredient);
                           },);
                        }),
                      ),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(vertical: width * 0.03,horizontal: width * 0.02),
                //
                //   //Button//////////////
                //   child: Text('Please select one or more ingredient to view a recipe',style: TextStyle(fontSize: 12,color: Colors.grey,fontFamily: 'NunitoSans-SemiBold'),),),
                Expanded(
                  child: Stack(
                    children:[ Container(

                      child: ListView.builder(
                          itemCount: addingredients.iteam.length,
                          itemBuilder: (context,index){
                            return IngerdientsItemButton(
                              list: addingredients.selectedIngredient,
                              text: addingredients.iteam[index],
                              isSelected:(bool value) {
                              setState(() {
                                if (value) {
                                  addingredients.additem(addingredients.iteam[index]);
                                } else {
                                  addingredients.removeitem(addingredients.iteam[index]);
                                }
                                print(addingredients.selectedIngredient);
                              });
                            },);
                          }),),
                      Positioned(
                        bottom: width * 0.07,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AvaliableRecipeButton(width: width,text: addingredients,onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AvailableScreen())),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    )
 );
  }
}

class SelectedItem extends StatelessWidget {
final text;
final onTap;
SelectedItem({this.text,this.onTap});
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    final containerWidth = double.parse(text.length.toString());
    print(containerWidth);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xffe7e7e7)
      ),
      child: Row(

        children: [

          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(text,style: TextStyle(color: Color(0xff555555),fontSize: 14,fontFamily: "NunitoSans-SemiBold"),),
          ),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
              height: width * 0.04,
              width: width * 0.04,
              decoration: BoxDecoration(
                color: Color(0xff999A9D),
                borderRadius: BorderRadius.circular(30)
              ),
              child: IconButton(
                  padding: EdgeInsets.all(1),
                  onPressed: onTap, icon: Icon(FontAwesomeIcons.xmark ,size: 10,color: Colors.white,)))
        ],
      ),
    );
  }
}
