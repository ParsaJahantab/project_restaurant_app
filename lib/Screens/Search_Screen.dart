import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Screens/Home.dart';
import 'package:restaurant/Screens/Login.dart';
import 'package:restaurant/Screens/food_edit.dart';
import 'package:restaurant/Screens/register.dart';
import 'package:restaurant/Screens/MainPanel.dart';
import 'package:restaurant/modals/Comments.dart';
import 'package:restaurant/modals/res_info.dart';

import 'BreakfastMenu.dart';
import 'DinnerMenu.dart';
import 'Menu_Screen.dart';
class Search_Screen extends StatefulWidget {
  final String Number;
  final int res_index;
  final String SearchText;
  final String type;
  Function change1;
  Search_Screen(this.Number,this.res_index,this.change1,this.SearchText,this.type);
  @override
  _State createState() => _State();
}

class _State extends State<Search_Screen> {
  var _fromKey1=GlobalKey<FormState>();
  //bool value;
  String Answer;
  change(String text)
  {
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 12, 110, 1),
        title: Text('menu'),
        actions: [
        ],
      ),
      body: Column(
          children:[
            Expanded(
              child: ListView.builder(
                  itemCount: restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().length,
                  itemBuilder: (BuildContext context,int index){
                    if ((widget.type=='all' || restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().elementAt(index).type==widget.type ) && (restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().elementAt(index).name.contains(widget.SearchText)))
                    {
                      return InkWell(
                        onTap: () =>Navigator.of(context).push(MaterialPageRoute(builder: (context) => Food_edit(widget.Number, widget.res_index,index,change))),
                        child: Container(
                            margin: EdgeInsets.all(15.0),
                            padding: EdgeInsets.all(25.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 2.0,
                                      blurRadius: 5.0
                                  )
                                ]
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  child: Image.asset('assets/images/logo.png',width: 80,height: 80,fit: BoxFit.cover),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0,top: 8.0,bottom: 8.0),
                                        child: Text(restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().elementAt(index).name,style: TextStyle(fontSize: 12.0,color: Colors.black54)),
                                      ),
                                      Text(restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().elementAt(index).price.toString(),style: TextStyle(fontSize: 12.0,color: Colors.black54)),
                                      CupertinoSwitch(
                                          value:restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().elementAt(index).isavailable ,
                                          onChanged: (value){
                                            setState(() {
                                              restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().elementAt(index).available_change();
                                              widget.change1('name');
                                            });
                                          }
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                      );
                    }
                    else {
                      return Container();
                    }
                  }
              ),
            ),
          ]
      ),
    );
  }
}
