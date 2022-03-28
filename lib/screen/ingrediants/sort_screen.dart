import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_hero/provider_model/provider_model.dart';

class SortScreen extends StatefulWidget {
  const SortScreen({Key? key}) : super(key: key);

  @override
  State<SortScreen> createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  bool isSelected = false;
  List item = [
    'Relevance',
    'Popularity',
    'Date Added',
    'Average Review',
    'Name'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          "Sort By",
          style: TextStyle(fontFamily: 'NunitoSans-Bold', color: Colors.black),
        )),
        elevation: 0.7,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: ()=>Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Consumer<Sort>(
        builder: (context,sort,child){
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return SortCard(text: item[index],isSelected: (value){
                    setState(() {
                    });
                    print(value);
                    sort.sortOrder(item[index]);
                  },);
                },
              ));
        },
      )
    );
  }
}

class SortCard extends StatefulWidget {
  SortCard({this.text,required this.isSelected});
  final text;
  final ValueChanged<bool> isSelected;

  @override
  _SortCardState createState() => _SortCardState();
}

class _SortCardState extends State<SortCard> {
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
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                  },
                  icon: Icon(
                    Icons.check,
                    color:isSelected?Color(0xffff0000):Colors.white,
                  )),
            ),
            Text( widget.text,
              style: TextStyle(fontSize: 14, color: Color(0xff555555)),
            ),
          ],
        ),
      ),
    );
  }
}
