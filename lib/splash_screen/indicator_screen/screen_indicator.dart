import 'package:flutter/material.dart';
import 'package:recipe_hero/screen/dietary_preferences/dietary_preferences_screen.dart';
import 'package:recipe_hero/splash_screen/indicator_screen/indicator_screens.dart';
import 'package:recipe_hero/splash_screen/spalsh_screen.dart';

class PageIndicator extends StatefulWidget {

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  final List<Widget> pages =[GetStartScreen(),GetStartScreen()];
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  int currentPageValue =0;

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(child: Container(
      width:width ,
      height: height * 0.96,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(

            physics: ClampingScrollPhysics(),
            itemCount: pages.length,
            onPageChanged: (int page) {
              setState(() {

              });
              getChangedPageAndMoveBar(page);
              print(page);
            },
            controller: controller,
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),
          Positioned(
            bottom: 40,
            child: Stack(
              alignment: Alignment.bottomCenter,

              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 35),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < pages.length; i++)
                        if (i == currentPageValue) ...[circleBar(true)] else
                          circleBar(false),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              if(currentPageValue==0 && mounted){
                currentPageValue =1;
                setState(() {

                });
              }
              else if(currentPageValue==1){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DietaryPreferencesScreen()));
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              child: Text("Skip",style: TextStyle(fontSize: 20,fontFamily: "NunitoSans-Bold"),),),
          )
        ],
      ),
    ),) ,));
  }
  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          color: isActive ? Color(0xff999A9D) : Color(0xffE7E7E7),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
  void getChangedPageAndMoveBar(int page) {
 currentPageValue = page;
  }
}
