import 'package:flutter/material.dart';
import 'package:recipe_hero/screen/ingrediants/sort_screen.dart';

class MeasurementSetting extends StatefulWidget {
  const MeasurementSetting({Key? key}) : super(key: key);

  @override
  State<MeasurementSetting> createState() => _MeasurementSettingState();
}

class _MeasurementSettingState extends State<MeasurementSetting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:  AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading:IconButton(onPressed: ()=>Navigator.pop(context),icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
          title: Center(
              child: Text(
                "Measurement Preferences",
                style: TextStyle(fontFamily: 'NunitoSans-Bold', color: Colors.black),
              )),
          actions: [
            Icon(Icons.arrow_back_ios)
          ],
        ),
        body: Container(
          child: Column(
            children: [
              SortCard(isSelected: (bool value) {setState(() {});},text: "US System",),
              SortCard(isSelected: (bool value) {setState(() {});},text: "Metric System",),

            ],
          ),
        ),
      ),
    );
  }
}
