import 'package:flutter/material.dart';
import 'package:recipe_hero/screen/setting/dietary_setting.dart';
import 'package:recipe_hero/screen/setting/measurement_preferences.dart';
import 'package:recipe_hero/screen/setting/privacy_policy.dart';

import 'about_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.9,
          title: Center(
              child: Text(
                "Setting",
                style: TextStyle(fontFamily: 'NunitoSans-Bold', color: Colors.black),
              )),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SettingButton(text: "Dietary Preferences",onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DietarySetting())),iconColor: Color(0xffCFD5E1),),
              SettingButton(text: "Measurement Preferences",onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MeasurementSetting())),iconColor: Color(0xffCFD5E1),),
              SettingButton(text: "",onTap: (){},iconColor: Colors.white,),
              SettingButton(text: "About Recipe Hero",onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutScreen())),iconColor: Color(0xffCFD5E1),),
              SettingButton(text: "Privacy Policy",onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy())),iconColor: Color(0xffCFD5E1),),

  
            ],)
        ),
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  SettingButton({this.text,this.onTap,this.iconColor});
final onTap;
final text;
final iconColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 46,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(text,style: TextStyle(fontFamily: "NunitoSans-SemiBold",fontSize: 16,color: Color(0xff555555)),),
          Icon(Icons.navigate_next,color: iconColor,)
        ],),
      ),
    );
  }
}
