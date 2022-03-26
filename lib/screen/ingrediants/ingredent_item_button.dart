
import 'package:flutter/material.dart';

class IngerdientsItemButton extends StatefulWidget {
  final text;
  final ValueChanged<bool> isSelected;
  final list;
  IngerdientsItemButton({this.text,required this.isSelected,this.list});

  @override
  _IngerdientsItemButtonState createState() => _IngerdientsItemButtonState();
}

class _IngerdientsItemButtonState extends State<IngerdientsItemButton> {
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
        child: ListTile(
          horizontalTitleGap: -10,
          leading: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Color(0xffE7E7E7),width: 2)
            ),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: (widget.list.contains(widget.text))?Color(0xffff0000):Colors.white,

              child: Icon(Icons.check,color:Colors.white,size: 16,),
            ),
          ),
          title: Text(widget.text,style: TextStyle(color: Colors.black,fontFamily: "NunitoSans-SemiBold"),),
        ),
      ),
    );
  }
}
