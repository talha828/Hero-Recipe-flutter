import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading:IconButton(onPressed: ()=>Navigator.pop(context),icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
          title: Center(
              child: Text(
                "About Hero Recipes",
                style: TextStyle(fontFamily: 'NunitoSans-Bold', color: Colors.black),
              )),
          actions: [
            Icon(Icons.arrow_back_ios),
          ],
        ),
        body:SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              children: [
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lectus arcu bibendum at varius vel pharetra vel turpis. Vestibulum morbi blandit cursus risus at ultrices. Arcu dictum varius duis at. Enim nec dui nunc mattis enim ut tellus. Viverra accumsan in nisl nisi scelerisque eu ultrices. Vestibulum sed arcu non odio euismod lacinia at quis risus. Tortor condimentum lacinia quis vel. A erat nam at lectus urna duis convallis convallis tellus. Sit amet luctus venenatis lectus magna fringilla urna. Interdum posuere lorem ipsum dolor sit amet consectetur adipiscing elit.",style: TextStyle(fontSize: 16,color: Color(0xff555555)),),
                SizedBox(height: 15,),
                Text("Aliquam ut porttitor leo a diam. Enim neque volutpat ac tincidunt vitae. Et malesuada fames ac turpis egestas integer eget aliquet. Ultrices neque ornare aenean euismod elementum nisi quis eleifend. Tortor condimentum lacinia quis vel. Pellentesque habitant morbi tristique senectus et netus et malesuada. Lacus suspendisse faucibus interdum posuere lorem. Elit ut aliquam purus sit amet. Ut etiam sit amet nisl purus in mollis. A condimentum vitae sapien pellentesque. Erat imperdiet sed euismod nisi porta lorem mollis aliquam. Tincidunt augue interdum velit euismod in pellentesque.",style: TextStyle(fontSize: 16,color: Color(0xff555555)),),

              ],
            ) ,
      ),
        ),
        ),
    );
  }
}
