import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_hero/screen/browse/browes_main_card.dart';
import 'package:recipe_hero/screen/favorites/favorite_card.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  var items = ['Sort By Date Added', 'Item 2', 'Item 3', 'Item 4', 'Item 5',];
  var image =['pizza.jpg',"burger.jpg","korma.jpg","roll.jpg"];
  var title=["Go-Go-Gourmet Pizza	","The IceBurg","Chicken Korma with Spicy Chilli","Takka Roll"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
           body: SingleChildScrollView(
             child: Container(
               margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Today`s Specials",style: TextStyle(fontSize: 24,fontFamily: "Halant-SemiBold"),),
                   SizedBox(height: 9,),
                   Container(
                     height: 240,
                       child: BrowseMainCard(image:"assets/temp-pic/pizza.jpg",title:"Pizza with cheese and chilli",subtitle: "Food Network",check: true,)),
                   SizedBox(height: 15,),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10),
                     child: Text("New Recipes",style: TextStyle(fontSize: 20,fontFamily: "NunitoSans-SemiBold"),),
                   ),
                   Container(
                     height: 270,
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                         shrinkWrap: true,
                         itemCount: title.length,
                         itemBuilder: (context,index){
                       return Container(
                           width: 180,
                           child: FavoriteCard(image:"assets/temp-pic/${image[index]}",title: title[index],subtitle: "Food Network",check:false,));
                     }),
                   ),
                   SizedBox(height: 15,),
                   Padding(
                     padding: const EdgeInsets.symmetric(vertical: 10),
                     child: Text("Popular",style: TextStyle(fontSize: 20,fontFamily: "NunitoSans-SemiBold"),),
                   ),
                   Container(
                     height: 270,
                     child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         shrinkWrap: true,
                         itemCount: title.length,
                         itemBuilder: (context,index){
                           return Container(
                               width: 180,
                               child: FavoriteCard(image:"assets/temp-pic/${image[index]}",title: title[index],subtitle: "Food Network",check: true,));
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
