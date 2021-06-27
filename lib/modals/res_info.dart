import 'package:flutter/material.dart';
import 'package:restaurant/modals/Comments.dart';
import 'package:restaurant/modals/commets_list.dart';
import 'package:restaurant/modals/Comments_map.dart';
import 'package:restaurant/modals/Reports.dart';
import 'package:restaurant/modals/Menu.dart';
class Res{
  String Name;
  String Password;
  String Address;
  String Number;
  String Category;
  Comment_list comment_list=new Comment_list();
  Report_list report_list=new Report_list();
  Menu menu=new Menu();
  Res(String Name,String Password,String Address,String Number,String Category,Comment_list comment_list,Report_list report_list,Menu menu)
  {
    this.Name=Name;
    this.Password=Password;
    this.Address=Address;
    this.Number=Number;
    this.Category=Category;
    this.comment_list=comment_list;
    this.menu=menu;
    this.report_list=report_list;
  }
  String getName()
  {
    return Name;
  }
  String getPassword()
  {
    return Password;
  }
  String getNumber()
  {
    return Number;
  }
}
class restaurant_info{
  static List<Res> res_info=List.empty(growable: true);
  static void res_add(String Name,String Password,String Address,String Number,String Category,Comment_list comment_list,Report_list report_list,Menu menu)
  {
    Res res=new Res(Name,Password,Address,Number,Category,comment_list,report_list,menu);
    res_info.add(res);
  }
  static List<Res> getRestaurants()
  {
    return res_info;
  }
  bool Password_serch(String pass){
    for(int i=0;i<getRestaurants().length;i++)
      {
        if (pass==getRestaurants().elementAt(i).getPassword())
          {
            return true;
          }
      }
    return false;
  }
  static bool Number_serch(String num){
    for(int i=0;i<getRestaurants().length;i++)
    {
      if (num==getRestaurants().elementAt(i).getNumber())
      {
        return true;
      }
    }
    return false;
  }
  static bool login_confirm(String num,String pass)
  {
    for(int i=0;i<getRestaurants().length;i++) {
      print("number="+num);
      if (num == getRestaurants().elementAt(i).getNumber()) {
        print("number="+num);
        print("password="+pass);
        if (pass == getRestaurants().elementAt(i).getPassword()) {
          return true;
        }
        else {
          return false;
        }
      }
    }
    return false;
  }
}