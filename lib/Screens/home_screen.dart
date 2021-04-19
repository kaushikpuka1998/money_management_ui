import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../card_model.dart';
import '../data_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int current = 0;

  List<T> map<T>(List list,Function handler)
  {
    List<T> result = [];
    for(var i = 0;i<list.length;i++)
      {
        result.add(handler(i,list[i]));
      }

    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
          body: Container(
            //AppBar
            margin: EdgeInsets.only(top:8),
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16,right: 16,top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        GestureDetector(
                          onTap:()
                          {

                            print("Drawer Pressed");
                          },

                          child: SvgPicture.asset('images/navigation.svg',height: 34,width: 34,),
                        ),

                        Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration
                              (
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(image: AssetImage('images/profile.png')),
                              ),
                          ),


                      ],
                    ),
                  ),
                SizedBox(
                  height: 24,
                ),

                Padding(
                  padding: EdgeInsets.only(left:16,bottom:16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Good Morning",style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                      ),),
                      Text("Kaushik Ghosh",style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),)
                    ],
                  ),
                ),


                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 12,right:12),
                    itemCount: cards.length,
                    itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(cards[index].cardbackground),
                        ),

                        child: Stack(
                          children: <Widget>[
                            Positioned(
                                left: 20,
                                top: 14,
                                child: Text("Card Number",style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white
                                ),)
                            ),
                            Positioned(
                                left: 20,
                                top: 40,
                                child: Text(cards[index].cardNumber,style: GoogleFonts.inter(
                                    fontSize: 26,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white
                                ),)
                            ),
                            Positioned(
                                left: 20,
                                top: 160,
                                child: Text(cards[index].user,style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),)
                            ),
                            Positioned(
                                left: 20,
                                top: 80,
                                child: Image.asset("images/chip.jpg",width: 45,height: 45,),
                            ),
                            Positioned(
                                left: 180,
                                top: 90,
                                child: Text("VALID UPTO:",style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white
                                ),)
                            ),
                            Positioned(
                                left: 280,
                                top: 90,
                                child: Text(cards[index].cardexpire,style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white
                                ),)
                            ),
                            Positioned(
                              top:130,
                              left: 270,
                              child: Image.asset(cards[index].cardtype,width: 54,height: 54,),
                            )

                          ],
                        ),

                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:16.0,left: 16,bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Operations",style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      Row(

                        children: map<Widget>(datas,(index,selected)
                        {
                          return Container(

                            alignment: Alignment.centerLeft,
                            height: 9,
                            width: 9,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: current==index?Colors.blue:Colors.grey,
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),

                Container(
                  height: 130,
                  child: ListView.builder(

                    itemCount: datas.length,
                      padding: EdgeInsets.only(left: 12),
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (context,index) {

                      return GestureDetector(

                        onTap: ()
                        {
                          setState(() {
                            current = index;
                          });
                        },
                        child: OperationCard (

                          operation: datas[index].details,
                          selectedIcon: datas[index].image,
                          unselectedIcon: datas[index].image,
                          isSelected: current==index,
                          context : this,

                        ),
                      );
                      }),
                )
              ],
            ),
          ),
    );
  }
}

class OperationCard extends StatefulWidget {

  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;

  _HomeScreenState context;

  OperationCard(
  {this.operation, this.selectedIcon, this.unselectedIcon, this.isSelected,this.context});

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 135,
      height: 125,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 7,
            spreadRadius: 3,
            offset: Offset(6,6),
          )
        ],

        borderRadius: BorderRadius.circular(10),
          color: widget.isSelected?Colors.blue:Colors.white
      ),

      child: Column(
        children: <Widget>[
          SizedBox(height: 18,),
          SvgPicture.asset(widget.isSelected?widget.selectedIcon:widget.unselectedIcon,height: 60,width: 60,),

          SizedBox(height: 10,),
          
          Text(widget.operation,textAlign:TextAlign.center,style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color:widget.isSelected?Colors.white:Colors.blue
          ),)
        ],
      ),

    );
  }
}

