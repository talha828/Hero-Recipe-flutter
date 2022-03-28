import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hero/provider_model/provider_model.dart';
import 'package:recipe_hero/screen/favorites/favorite_card.dart';
import 'package:recipe_hero/screen/favorites/recipe_screen.dart';
import 'package:recipe_hero/screen/ingrediants/filters_screen.dart';
import 'package:recipe_hero/screen/ingrediants/sort_screen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String dropdownvalue = 'Sort By Date Added';
  var items = ['Sort By Date Added', 'Item 2', 'Item 3', 'Item 4', 'Item 5',];
  var image =['pizza.jpg',"burger.jpg","korma.jpg","roll.jpg"];
  var title=["Go-Go-Gourmet Pizza	","The IceBurg","Chicken Korma with Spicy Chilli","Takka Roll"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          "Favorites",
          style: TextStyle(fontFamily: 'NunitoSans-Bold', color: Colors.black),
        )),
        leading:  Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 20,
            height: 20,
            child: Image(
              color: Colors.white,
              image: AssetImage(
                "assets/icon/menu-icon.png",
              ),
            )),
        elevation: 0.0,
        actions: [
          InkWell(
            onTap: ()=>showCupertinoModalBottomSheet(
              context: context,
              builder: (context) =>FiltersScreen(),
            ),
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
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Consumer<Sort>(
                      builder: (context,sort,child){
                        return InkWell(
                          onTap: ()=>showCupertinoModalBottomSheet(
                            context: context,
                            builder: (context) =>SortScreen(),
                          ),
                          child: Container(

                              child: Row(children: [
                                Text("Sort By ${sort.dropdownvalue}",style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontFamily: "NunitoSans-SemiBold"),),
                                Icon(Icons.keyboard_arrow_down_rounded,color: Colors.grey,)
                              ],)
                          ),
                        );
                      },
                    ),
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
                        child: FavoriteCard(image:"assets/temp-pic/${image[index]}",title: title[index],subtitle: "Food Network",check: true,));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
