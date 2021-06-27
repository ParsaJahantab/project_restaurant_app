import 'package:flutter/material.dart';
class Food {
  String name;
  double price;
  String desc;
  Image image;
  bool isavailable=true;
  String type;
  int menu_index;
  AssetImage assetImage=new AssetImage('assets/logo.png');
  Food(String name, double price, String desc,String type) {
    this.name = name;
    this.price = price;
    this.desc= desc;
    this.type=type;
    //this.image=new Image(image: assetImage,width: 50,height: 50);
  }
  Food.fromFood(String name, double price, String desc,String type,int menuIndex) {
    this.name = name;
    this.price = price;
    this.desc= desc;
    this.type=type;
    this.menu_index=menuIndex;
  }
  void available_change()
  {
    this.isavailable=!this.isavailable;
  }
}

class Menu{
  List<Food> menu=List.empty(growable: true);
  void menu_add(String name, double price, String desc,String type)
  {
    Food food=new Food (name,price,desc,type);
    menu.add(food);
  }
  List<Food> getMenu()
  {
    return menu;
  }
  List<Food> getLunchMenu()
  {
    List<Food> lunch_menu=List.empty(growable: true);
    for(int i=0;i<menu.length;i++)
      {
        if (menu.elementAt(i).type=='lunch')
          {
            Food food=new Food.fromFood(menu.elementAt(i).name,menu.elementAt(i).price,menu.elementAt(i).desc,menu.elementAt(i).type,i);
            lunch_menu.add(food);
          }
      }
      return lunch_menu;
  }
}
