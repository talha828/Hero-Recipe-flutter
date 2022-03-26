import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hero/provider_model/provider_model.dart';
import 'package:recipe_hero/screen/bottom_bar_navigation/bottom_bar_navigation.dart';
import 'package:recipe_hero/screen/ingrediants/ingredients.dart';
import 'dietary_iteam_button.dart';

class DietaryPreferencesScreen extends StatefulWidget {
  const DietaryPreferencesScreen({Key? key}) : super(key: key);

  @override
  State<DietaryPreferencesScreen> createState() =>
      _DietaryPreferencesScreenState();
}

class _DietaryPreferencesScreenState extends State<DietaryPreferencesScreen> {
  List<Widget> iteam =[];

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
     var iteamwidth= width * 0.2;
     var iteamheight = width *  0.1;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Consumer<SelectItem>(
           builder: (context,selectitem,child){
             return  Container(
               margin: EdgeInsets.symmetric(horizontal: 10),
               width: width,
               height: height * 0.96,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   Container(
                     alignment: Alignment.center,
                     padding: EdgeInsets.only(top: width * 0.1,bottom: width *0.04),
                     child: Text(
                       'Dietary Preferences',
                       style: TextStyle(
                         fontSize: 24,
                         fontFamily: "NunitoSans-SemiBold",
                       ),
                     ),
                   ),
                   Container(
                       padding: EdgeInsets.only(bottom: 15),
                       child: Row(
                         children: [
                           Flexible(
                             child: Text(
                               'Add any dietary preferences you have. you can change the dietary preferences any time in the filters or setting',
                               textAlign: TextAlign.center,
                               style: TextStyle(fontSize: 12, color: Color(0xff999A9D),fontFamily: "NunitoSans-SemiBold", ),
                             ),
                           ),
                         ],
                       )),

                   Expanded(child: Container(
                       child: GridView.builder(
                           itemCount: selectitem.preferences.length,
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 3,
                               childAspectRatio: 1.9,
                               crossAxisSpacing: 2,
                               mainAxisSpacing: 2),
                           itemBuilder: (context, index) {
                             return DietaryiteamButton(
                               text: selectitem.preferences[index],
                               isSelected: (bool value) {
                               setState(() {
                                 if (value) {selectitem.additem(selectitem.preferences[index]);} else {selectitem.removeitem(selectitem.preferences[index]);}
                                 print(selectitem.selectediteam);

                               });
                             },);
                           }),
                     ),
                   ),


                   Container(
                     alignment: Alignment.center,
                     margin: EdgeInsets.symmetric(horizontal: 10),
                     decoration: BoxDecoration(
                         color: (selectitem.selectediteam.length == 0)?Color(0xff999A9D):Color(0xffff0000),
                         borderRadius: BorderRadius.circular(20)
                     ),
                     padding: EdgeInsets.symmetric(vertical: 10,),
                     child:  Text("Continue",style: TextStyle(fontSize:20,fontFamily:"NunitoSans-Bold",color: Colors.white),),),
                   SizedBox(height: 5,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       InkWell(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBarNavigation()));
                         },
                         child: Container(
                           padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                           child: Text("Skip",style: TextStyle(fontSize: 20,fontFamily: "NunitoSans-Bold"),),),
                       ),
                     ],
                   ),
                 ],
               ),
             );
           },
          )),
    ));
  }
}
