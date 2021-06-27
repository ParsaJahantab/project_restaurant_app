import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant/Screens/Home.dart';
import 'package:restaurant/Screens/Login.dart';
import 'package:restaurant/Screens/Menu_Screen.dart';
import 'package:restaurant/Screens/Today_Report_Screen.dart';
import 'package:restaurant/Screens/food_edit.dart';
import 'package:restaurant/Screens/register.dart';
import 'package:restaurant/Screens/MainPanel.dart';
import 'package:restaurant/modals/Comments.dart';
import 'package:restaurant/modals/commets_list.dart';
import 'package:restaurant/modals/Comments_map.dart';
import 'package:restaurant/Screens/Comment_Screen.dart';
import 'package:restaurant/modals/res_info.dart';
import 'package:restaurant/Screens/Report_Screen.dart';
import 'package:restaurant/modals/Menu.dart';
import 'Screens/BreakfastMenu.dart';
import 'Screens/DinnerMenu.dart';
import 'Screens/LunchMenu_Screen.dart';
import 'modals/Reports.dart';
//final Socket socket;
/*void SendMessage ()async{
  await Socket.connect("10.0.2.2",6000).then((serverSocket){
    serverSocket.write("salam");
  });
}*/
void main() {
  //SendMessage();
  Comment_list comment_list=new Comment_list();
  comment_list.Comm_add("author1", "comment1", 7);
  comment_list.Comm_add("author2", "comment2", 3);
  comment_list.Comm_add("author3", "comment3", 8);
  print(comment_list);
  Report_list report_list=new Report_list();
  Menu menu=new Menu();
  menu.menu_add("food1", 1000,"desc",'lunch');
  menu.menu_add("food2", 1000,"desc",'dinner');
  menu.menu_add("food3", 1000,"desc",'breakfast');
  menu.menu_add("food4", 1000,"desc",'lunch');
  menu.menu_add("food5", 1000,"desc",'dinner');
  DateTime dateTime=DateTime.now();
  DateTime dateTime1=DateTime(2020);
  print(dateTime);
  report_list.Rep_add("123", 1000, "name", dateTime, true);
  report_list.Rep_add("123", 1000, "name", dateTime, true);
  report_list.Rep_add("123", 1000, "name", dateTime1, true);
  report_list.Rep_add("123", 1000, "name", dateTime1, true);
  print(comment_list.getComments().elementAt(0).comment);
  restaurant_info.res_add("r1", "13812002", "51.5 -0.09", "1234", "sonati", comment_list, report_list,menu);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String Number="";
  final int index=0;
  final int index1=0;
  change(){}
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/":(context)=>Home(),
        "/register":(context) => register_screen(),
        "/login":(context)=> Login_Screen(),
       "/mainpanel":(context)=> MainPanel(Number,index),
       "/mainpanel/comment_screen":(context)=> Comment_Screen(Number,index),
        "/mainpanel/report_screen":(context)=> Report_Screen(Number,index),
        "/mainpanel/today_report_screen":(context)=> Today_Report_Screen(Number,index,change),
        "/mainpanel/menu_screen":(context)=> Menu_Screen(Number,index),
        "/mainpanel/menu_screen/lunch_menu_screen":(context)=> Lunch_Menu_Screen(Number,index,change),
        "/mainpanel/menu_screen/breakfast_menu_screen":(context)=> Breakfast_Menu_Screen(Number,index,change),
        "/mainpanel/menu_screen/dinner_menu_screen":(context)=> Dinner_Menu_Screen(Number,index,change),
        "/mainpanel/menu_screen/food_edit":(context)=> Food_edit(Number,index,index1,change),


      }
    );
  }
}
