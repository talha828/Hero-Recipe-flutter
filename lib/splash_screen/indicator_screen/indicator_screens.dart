import 'package:flutter/material.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
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
                      Text("COMING SOON" ,style: TextStyle(fontSize:16,fontFamily: "NunitoSans-SemiBold",color: Color(0xff555555)),)
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
