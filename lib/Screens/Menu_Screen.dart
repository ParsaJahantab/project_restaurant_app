import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Screens/BreakfastMenu.dart';
import 'package:restaurant/Screens/DinnerMenu.dart';
import 'package:restaurant/Screens/Home.dart';
import 'package:restaurant/Screens/Login.dart';
import 'package:restaurant/Screens/Search_Screen.dart';
import 'package:restaurant/Screens/food_edit.dart';
import 'package:restaurant/Screens/register.dart';
import 'package:restaurant/Screens/MainPanel.dart';
import 'package:restaurant/modals/Comments.dart';
import 'package:restaurant/modals/res_info.dart';
import 'package:restaurant/Screens/BreakfastMenu.dart';
import 'LunchMenu_Screen.dart';
class Menu_Screen extends StatefulWidget {
  final String Number;
  final int res_index;
  const Menu_Screen(this.Number,this.res_index);
  @override
  _State createState() => _State();
}

class _State extends State<Menu_Screen> {
  var _fromKey1=GlobalKey<FormState>();
  final TextEditingController filter = new TextEditingController();
  Icon SearchIcon=Icon(Icons.search);
  Widget AppbarTitle=Text("menu");
  //bool value;
  change(String text)
  {
    setState(() {

    });
  }
  String Answer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(237, 12, 110, 1),
        title: AppbarTitle,
        actions: [
          IconButton(
              icon: SearchIcon,
              onPressed: (){
                setState(() {
                  if (SearchIcon.icon==Icons.search)
                    {
                      SearchIcon=new Icon(Icons.close);
                      AppbarTitle=new TextField(
                        onSubmitted: (value){
                          if (value.isNotEmpty && value!=null)
                            {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Search_Screen(widget.Number, widget.res_index,change,value,'all')));
                            }
                        },
                          controller: filter,
                          decoration: new InputDecoration(
                          prefixIcon: new Icon(Icons.search),
                          hintText: 'Search...',
                      )
                      );
                    }
                  else
                    {
                      SearchIcon=new Icon(Icons.search);
                      AppbarTitle=new Text('menu');
                      setState(() {
                      });
                    }
                });
              }
          )
        ],
      ),
      body: Column(
        children:[
          Container(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(00.0))),
                        ),

                        onPressed: (){
                          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Menu_Screen(widget.Number, widget.res_index)));
                        },
                        child: Text('menu'),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(00.0))),
                        ),

                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Breakfast_Menu_Screen(widget.Number, widget.res_index,change)));
                        },
                        child: Text('breakfast menu'),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(00.0))),
                        ),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Lunch_Menu_Screen(widget.Number, widget.res_index,change)));
                        },
                        child: Text('lunch menu'),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(00.0))),
                        ),

                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dinner_Menu_Screen(widget.Number, widget.res_index,change)));
                        },
                        child: Text('dinner menu'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().length,
              itemBuilder: (BuildContext context,int index){
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
          ),
        ),
    ]
    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,size: 29,),
            onPressed: (){
          showModalBottomSheet(
              context: context,
              builder: (context){
                return Container();
              }
          );
            },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}
