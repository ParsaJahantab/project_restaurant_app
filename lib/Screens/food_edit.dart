import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/modals/res_info.dart';
class Food_edit extends StatefulWidget {
  Function change;
  final String Number;
  final int res_index;
  final int menu_index;
  Food_edit(this.Number,this.res_index,this.menu_index,this.change);
  @override
  _Food_editState createState() => _Food_editState();
}

class _Food_editState extends State<Food_edit> {
  String name;
  String desc;
  String type="lunch";
  double price;
  var _fromKey3=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Container(
          child: Form(
            key: _fromKey3,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40),
                  width: MediaQuery.of(context).size.width*1,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        child: Image.asset('assets/images/logo.png',width: 80,height: 80,fit: BoxFit.cover),
                      ),
                      Container(
                        width:  MediaQuery.of(context).size.width*0.6,
                        padding: EdgeInsets.only(left: 7),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "نام غذا",
                            hintText: restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().elementAt(widget.menu_index).name,
                          ),
                          onSaved: (String value){
                            print("name: "+value);
                            name=value;
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40),
                  width: MediaQuery.of(context).size.width*1,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width:  MediaQuery.of(context).size.width*0.8,
                        child: TextFormField(
                          initialValue: restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().elementAt(widget.menu_index).desc,
                          maxLines: 5,
                          decoration: InputDecoration(
                            labelText: "توضیحات غذا",
                            hintMaxLines: 5,
                          ),
                            onSaved: (String value){
                              desc=value;
                            },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 40),
                  width: MediaQuery.of(context).size.width*1,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width:  MediaQuery.of(context).size.width*0.2,
                        child: TextFormField(
                          initialValue: restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().elementAt(widget.menu_index).price.toString(),
                          decoration: InputDecoration(
                            labelText: "قیمت",
                          ),
                            onSaved: (String value){
                              double value1=double.parse(value);
                              price=value1;
                            },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.1),
                        width:  MediaQuery.of(context).size.width*0.6,
                        child: Row(
                          children: [
                            Text("breakfast"),
                            Radio(
                              value: "breakfast",
                              groupValue: type,
                              onChanged: (T){
                                setState(() {
                                  type =T;
                                });
                              },
                            ),
                            Text("lunch"),
                            Radio(
                              value: "lunch",
                              groupValue: type,
                              onChanged: (T){
                                setState(() {
                                  type =T;
                                });
                              },
                            ),
                            Text("dinner"),
                            Radio(
                              value: "dinner",
                              groupValue: type,
                              onChanged: (T){
                                setState(() {
                                  type =T;
                                });
                              },
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: ElevatedButton(
                        onPressed:() {
                          setState(() {
                                  print(name);
                                  print(desc);
                                  print(price);
                                  print(type);
                                _fromKey3.currentState.save();
                                  print(name);
                                  print(desc);
                                  print(price);
                                  print(type);
                                restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().elementAt(widget.menu_index).name=name;
                                restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().elementAt(widget.menu_index).desc=desc;
                                restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().elementAt(widget.menu_index).price=price;
                                restaurant_info.getRestaurants().elementAt(widget.res_index).menu.getMenu().elementAt(widget.menu_index).type=type;

                                widget.change("name");
                          });
                        },
                        child: Text("ایجاد تغییر"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(16, 224, 24, 1)),
                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side:BorderSide(color: Colors.green),
                                )
                            )
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
