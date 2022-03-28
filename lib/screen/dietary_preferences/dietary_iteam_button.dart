import 'package:flutter/material.dart';

class DietaryiteamButton extends StatefulWidget {

  final text;
final ValueChanged<bool> isSelected;
  DietaryiteamButton({this.text,required this.isSelected});
  @override
  _DietaryiteamButtonState createState() => _DietaryiteamButtonState();
}

class _DietaryiteamButtonState extends State<DietaryiteamButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 4,vertical: 10),
        width: 100,
        height: 40,
        // padding: EdgeInsets.symmetric(vertical: 8,horizontal: 7),
        decoration: BoxDecoration(
          border: Border.all(color:(isSelected)?Color(0xffff0000):Colors.grey,width:(isSelected)?1:0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child:Text(widget.text,style: TextStyle(color:(isSelected)?Color(0xffff0000):Colors.grey,fontSize: 14),),),
    ) ;
  }
}

