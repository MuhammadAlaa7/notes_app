import 'package:flutter/material.dart';

/* 
       //              ----  STEPS NEEDED TO SEND THE SELECTED COLOR ----
              [1] - MAKE THE STEPS REVERSE STEPS  --> FROM END TO START   <--

           * 1. the note in the addNoteButton needs a color to be passed to its color property 
           * 2. declare a color store the color comes and give it to the note color property 
           * 3. there must be an even or an action [ function ] to put the color comes into that color variable 
           * 4. the function needs go to the place where the color i need is there , so i need to pass it to Colors list view class 
           * 5. the function goes there and is triggered when the color item is tapped it takes the selected color 
           *                             
           *                                         *********************
           *                                       اللي محتاج حاجه يروح يجيبها 
           *                                         *********************
*/

class ColorsListView extends StatefulWidget {
  const ColorsListView({
    super.key,
    required this.receivedSelectedColor,
  });

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
  // here i need a function to take the color from this function , here the link between the two functions occure
  final dynamic Function({Color? color}) receivedSelectedColor;
}

class _ColorsListViewState extends State<ColorsListView> {
  final colorsList = const [
    Color(0xffd62828),
    Color(0xff219ebc),
    Color(0xffeae2b7),
    Color(0xffffb703),
    Color(0xfffb8500),
  ];

  //\/ this is initial ... not selected
  int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 250,
      child: ListView.builder(
        itemCount: colorsList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final bool isSelected = index == currentIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
              // call the function and give it the color accroding to the index
              // THIS IS THE FUNCTION RESPONSIBLE FOR TAKE THE COLOR FROM THE ITEM WHEN TAPPED and
              // SNED IT TO THE PARENET WIDGET  [ THE BOTTOM SHEET CONTENT]

              widget.receivedSelectedColor(color: colorsList[index]);
            },
            child: ColorItem(
              color: colorsList[index],
              isSelected: isSelected,
            ),
          );
        },
      ),
    );
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.color,
    required this.isSelected,
  });

  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        backgroundColor: color,
        child: isSelected
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
