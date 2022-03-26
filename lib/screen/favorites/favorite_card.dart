import 'package:flutter/material.dart';


class FavoriteCard extends StatefulWidget {
  FavoriteCard({this.image,this.title,this.subtitle});
  final image;
  final title;
  final subtitle;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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

