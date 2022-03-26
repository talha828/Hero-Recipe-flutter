import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchField extends StatefulWidget {
  SearchField({this.onchange});
  final onchange;

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController controller =TextEditingController();
  bool check=false;
  bool textFeild=true;

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: (){
            textFeild=(textFeild==true)?false:true;
            check=(check==true)?false:true;
            setState(() {
            });
          },
          child: Container(

            width: (check)?250:320,
            child: AnimatedContainer(
              duration: Duration(seconds: 3),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: controller,
                enabled: textFeild,
                onTap: (){
                  textFeild=true;
                  check=true;
                  setState(() {
                  });
                },
                onChanged: widget.onchange,
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                      onTap: (){
                        textFeild=(textFeild==true)?false:true;
                        check=(check==true)?false:true;
                        setState(() {
                        });
                      },
                      child: Icon(Icons.search_outlined,size: 20,color: Color(0xff818181),)),
                  hintText: 'Search for an ingredient',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  helperStyle: TextStyle(color: Color(0xff818181)),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                suffix: Container(
                  margin: EdgeInsets.only(right: 10),
                  height: width * 0.04,
                  width: width * 0.04,
                  decoration: BoxDecoration(
                      color: Color(0xff999A9D),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: IconButton(
                      padding: EdgeInsets.all(1),
                      onPressed: (){}, icon: Icon(FontAwesomeIcons.xmark ,size: 10,color: Colors.white,)),
                )
                ),
              ),
            ),
          ),
        ),
        (check)?InkWell(
            onTap: (){
              check=(check==true)?false:true;
              textFeild=false;
              controller.clear();
              setState(() {
              });
            },
            child: Text('Cancel',style: TextStyle(color: Color(0xffff0000),fontSize: 18),)):Container()
      ],
    );
  }
}
