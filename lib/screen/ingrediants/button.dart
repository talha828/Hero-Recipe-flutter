
import 'package:flutter/material.dart';

class AvaliableRecipeButton extends StatefulWidget {
  AvaliableRecipeButton({this.text,this.width});
  final text;
  final width;

  @override
  _AvaliableRecipeButtonState createState() => _AvaliableRecipeButtonState();
}

class _AvaliableRecipeButtonState extends State<AvaliableRecipeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.9,
      height: widget.width * 0.13,
      alignment: Alignment.center,

      decoration: BoxDecoration(
          color: (widget.text.selectedIngredient.length == 0)?Color(0xff999A9D):Color(0xffff0000),
          borderRadius: BorderRadius.circular(30)
      ),
      padding: EdgeInsets.symmetric(vertical: widget.width * 0.02,),
      child:  Text("${widget.text.selectedIngredient.length}  Available Recipes",style: TextStyle(fontSize: 20,fontFamily:"NunitoSans-Bold",color: Colors.white),),);
  }
}
