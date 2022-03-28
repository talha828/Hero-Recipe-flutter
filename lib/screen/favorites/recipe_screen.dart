import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe_hero/screen/favorites/favorite_card.dart';

class RecipeScreen extends StatelessWidget {
   RecipeScreen({Key? key}) : super(key: key);
List quantity=['1','3/4 cup','2 tbsp','1 cup','1 tbsp','1 tsp','1 cup'];
List item=['Egg','Milk','Better','FLour','Sugar','Salt','Water'];
List pizza=['In a large bowl, add chicken, chilli sauce, black pepper, soy sauce, salt, vinegar, and garlic.','Mix to coat evenly.','Marinate for 25 minutes in the refrigerator.','Now cook chicken in a pan over medium heat, until tender.','Keep aside.',
'In another large bowl, combine the flour, salt, egg and yeast mixture.','Knead a soft dough with Luke warm water.','Preheat oven to 180 degree C.',
];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: ()=>Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios,color: Colors.black,size: 25,)),
        title: Center(child: Icon(FontAwesomeIcons.solidHeart,color: Color(0xffff0000),),),
        actions: [Container(
          margin: EdgeInsets.only(right: 20),
            width: 20,
            height: 20,
            child: Image(image: AssetImage("assets/icon/arrow-up.png")))],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height * 2.39,
          child: Column(children: [
            Container(
                width: width,
                height: width *0.6,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(
                          0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(48),
                    child: Image(image: AssetImage("assets/temp-pic/roll.jpg"),fit: BoxFit.cover,),
                  ),
                ),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Beginner |  Japanese |  30 Mints",style: TextStyle(color: Color(0xff999A9D),fontFamily: "NunitoSans-SemiBold"),),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("Pizza With Chilli and Garlic Sauce",style: TextStyle(fontSize: 30,fontFamily: "NunitoSans-Bold"),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Food Network",
                    style: TextStyle(
                        fontFamily: "NunitoSans-SemiBold",fontSize: 15,color: Colors.grey),
                  ),
                  Row(children: [
                    Icon(Icons.star,color: Colors.amber,size: 15,),
                    Icon(Icons.star,color: Colors.amber,size: 15,),
                    Icon(Icons.star,color: Colors.amber,size: 15,),
                    Icon(Icons.star,color: Colors.amber,size: 15,),
                    Icon(Icons.star_half,color: Colors.amber,size: 15,),
                  ],),
              ],),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10,top: 18,bottom: 15),
                  child: Text("Ingredient",style: TextStyle(fontSize: 30,fontFamily: "NunitoSans-Bold")),
                ),
              ],
            ),
            Row(children: [
               Container(
                 width:width /3,
                 height: width *0.9,
                 child: ListView.builder(
                     itemCount: quantity.length,
                     itemBuilder:(context,index){
                       return Container(
                           padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                           child: Text(quantity[index],style: TextStyle(fontSize: 18,color: Colors.grey),));
                     }),
               ),
              Container(
                width:width /2,
                height: width *0.9,
                child: ListView.builder(
                    itemCount: item.length,
                    itemBuilder:(context,index){
                      return Container(
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                          child: Text(item[index],style: TextStyle(fontSize: 18,color: Colors.grey),));
                    }),
              )
            ],),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10,top: 4,bottom: 15),
                  child: Text("Direction",style: TextStyle(fontSize: 30,fontFamily: "NunitoSans-Bold")),
                ),

              ],
            ),
            Container(
              width: width,
              height: width * 1.3,
              child:ListView.builder(
                  itemCount: pizza.length,
                  itemBuilder:(context,index){
                    return Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text((index+1).toString(),style: TextStyle(fontSize: 18,color: Colors.grey),),
                            SizedBox(width: 15,),
                            Flexible(child: Text(pizza[index],style: TextStyle(fontSize: 18,color: Colors.grey),)),
                          ],
                        ));
                  }),),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10,top: 10,bottom: 15),
                  child: Text("You May Also Like",style: TextStyle(fontSize: 25,fontFamily: "NunitoSans-Bold")),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: 450,
                height: 100,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context,index){
                      return Container(
                          height: 200,
                          child: FavoriteCard(image: "assets/temp-pic/pizza.jpg",title: "Pizza wala",subtitle: "Food Network",check: true,));
                    }),),
            ),
          ],),
        ),
      ),
    );
  }
}
