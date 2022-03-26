import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hero/provider_model/provider_model.dart';
import 'package:recipe_hero/screen/favorites/favorite_card.dart';
import 'package:recipe_hero/screen/favorites/recipe_screen.dart';

import 'filters_screen.dart';
import 'ingredients.dart';

class AvailableScreen extends StatefulWidget {
  const AvailableScreen({Key? key}) : super(key: key);

  @override
  State<AvailableScreen> createState() => _AvailableScreenState();
}

class _AvailableScreenState extends State<AvailableScreen> {
  String dropdownvalue = 'Sort By Date Added';
  var items = ['Sort By Date Added', 'Item 2', 'Item 3', 'Item 4', 'Item 5',];
  var image =['pizza.jpg',"burger.jpg","korma.jpg","roll.jpg"];
  var title=["Go-Go-Gourmet Pizza	","The IceBurg","Chicken Korma with Spicy Chilli","Takka Roll"];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
           elevation: 0.0,
           leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
          actions: [
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FiltersScreen())),
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: 20,
                  height: 20,
                  child: Image(
                    image: AssetImage(
                      "assets/icon/menu-icon.png",
                    ),
                  )),
            )
          ],
          title: Center(
              child: Text(
                "Recipes",
                style: TextStyle(fontFamily: 'NunitoSans-Bold', color: Colors.black),
              )),
        ),
        body: Consumer<AddIngredientList>(
          builder: (context,addingredients,child){
            return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),

                child:Column(
              children: [
                Container(

                  child: (addingredients.selectedIngredient.length==0)?Container():Container(
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
                ),),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "4 Recipes",
                        style: TextStyle(
                            color: Colors.grey, fontFamily: "NunitoSans-SemiBold"),
                      ),
                      DropdownButton(
                        underline: SizedBox(),
                        elevation: 0,
                        value: dropdownvalue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontFamily: "NunitoSans-SemiBold"),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: image.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: (){
                              showCupertinoModalBottomSheet(
                                context: context,
                                builder: (context) => RecipeScreen(),
                              );
                            },
                            child: FavoriteCard(image:"assets/temp-pic/${image[index]}",title: title[index],subtitle: "Food Network",));
                      },
                    ),
                  ),
                ),

              ],
            ));
          },
        )
      ),
    );
  }
}
