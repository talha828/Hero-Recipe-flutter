import 'package:flutter/material.dart';
import 'package:recipe_hero/screen/favorites/favorite_screen.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
      appBar:  AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Center(
            child: InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoriteScreen())),
              child: Text(
                "Favorites",
                style: TextStyle(fontFamily: 'NunitoSans-Bold', color: Colors.black),
              ),
            )),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height * 0.96,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("assets/image/mooch.png"),width:width *0.35 ,height: height *0.05,),
                          ],
                        ) ,
                      ),
                      SizedBox(height: 15,),
                      Text("Favorites a recipes to" ,style: TextStyle(fontSize:16,fontFamily: "NunitoSans-SemiBold",color: Color(0xff555555)),),
                      Text("see it here" ,style: TextStyle(fontSize:16,fontFamily: "NunitoSans-SemiBold",color: Color(0xff555555)),)

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
