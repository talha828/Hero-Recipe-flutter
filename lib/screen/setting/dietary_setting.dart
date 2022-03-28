import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hero/provider_model/provider_model.dart';
import 'package:recipe_hero/screen/dietary_preferences/dietary_iteam_button.dart';
import 'package:recipe_hero/screen/ingrediants/ingredients.dart';

class DietarySetting extends StatefulWidget {
  const DietarySetting({Key? key}) : super(key: key);

  @override
  State<DietarySetting> createState() => _DietarySettingState();
}

class _DietarySettingState extends State<DietarySetting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading:IconButton(onPressed: ()=>Navigator.pop(context),icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
        title: Center(
            child: Text(
              "Dietary Preferences",
              style: TextStyle(fontFamily: 'NunitoSans-Bold', color: Colors.black),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Center(child: Text("Reset All",style: TextStyle(fontFamily: 'NunitoSans-Bold',color: Color(0xffff0000),),)),
          )
        ],
      ),
      body: Container(
        child: Consumer<SelectItem>(
           builder: (context,selectitem,child){
             return Container(
               margin: EdgeInsets.symmetric(horizontal: 15),
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

                         });
                       },);
                   }),
             );
           },
        ),
      )
    ));
  }
}
