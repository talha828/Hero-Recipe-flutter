import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FavoriteCard extends StatefulWidget {
  FavoriteCard({this.image,this.title,this.subtitle,this.check});
  final image;
  final title;
  final subtitle;
  final check;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(

            children:[Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: 165,
                height: 165,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(
                          0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(48),
                      child: Image(
                        image: AssetImage(
                          widget.image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ))),
              Positioned(
                top: 10,
                right: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child:widget.check?Icon(FontAwesomeIcons.solidHeart,color: Color(0xffff0000),):Icon(FontAwesomeIcons.heart),),
              )

            ]
          ),
          Flexible(
              child: Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          widget.title,
                          style: TextStyle(fontSize: 16,
                              fontFamily: "NunitoSans-SemiBold"),
                        ),
                      ),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                            fontFamily: "NunitoSans-SemiBold",fontSize: 15,color: Colors.grey),
                      ),
                      Row(children: [
                        Icon(Icons.star,color: Colors.amber,size: 15,),
                        Icon(Icons.star,color: Colors.amber,size: 15,),
                        Icon(Icons.star,color: Colors.amber,size: 15,),
                        Icon(Icons.star,color: Colors.amber,size: 15,),
                        Icon(Icons.star_half,color: Colors.amber,size: 15,),
                      ],)
                    ],
                  ))),

        ],
      ),
    );
  }
}

