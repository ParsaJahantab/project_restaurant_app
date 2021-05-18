import 'package:flutter/material.dart';
import 'package:restaurant/Screens/Home.dart';
import 'package:restaurant/Screen_helpers/forms.dart';
import 'package:restaurant/modals/Menu.dart';
import 'package:restaurant/modals/res_info.dart';
import 'package:restaurant/modals/Comments.dart';
import 'package:restaurant/modals/Reports.dart';

class register_screen extends StatefulWidget {
  @override
  _State createState() => _State();
}
class _State extends State<register_screen > {
  var _fromKey=GlobalKey<FormState>();
  int group=1;
  String Category="fastfood";
  String Name;
  String Password;
  String Address;
  String Number;
  Comment_list comment_list;
  Report_list report_list;
  Menu menu=new Menu();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  Widget forms(String type,bool NS,bool AS,bool NumS,IconS)
  {
    return
      Column(
        children: [
          Flexible(
              flex: 6,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                child:
                Center(
                  child: TextFormField(
                  decoration: InputDecoration(
                      labelText: type+" را وارد کنید",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      prefixIcon: Icon(IconS),
                      filled: true,
                      fillColor: Colors.grey[200],
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                ),

                  ),
                  onSaved: (String value)
                  {
                    if (NS) {
                      Name = value;
                    }
                    else if (AS)
                      {
                        Address=value;
                      }
                    else if (NumS)
                      {
                        Number=value;
                      }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return type+' '+'نمیتواند خالی باشد';
                    }
                    if (NumS)
                      {
                        bool b=true;
                        for (int i=0;i<restaurant_info.getRestaurants().length;i++)
                          {
                            if(restaurant_info.getRestaurants().elementAt(i).Number==value.toString())
                              {
                                b=false;
                                break;
                              }
                          }
                        if (!b)
                          {
                            return "این شماره قبلا انتخاب شده است.";
                          }
                      }
                    return null;
                  },
                ),
              ),
        ),
    ),
    ]
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 12, 110, 1),
      body: Container(
        decoration: new BoxDecoration(
          //image: new DecorationImage(image: new Image(image: ), fit: BoxFit.cover,),

        ),
        child: Form(
          key: _fromKey,
          child: Column(
            children: [
              Flexible(
                flex: 8,
                  child: Image.asset('assets/images/logo.png'),
              ),
              Flexible(
                flex: 2,
                  child: forms('نام رستوران',true,false,false,Icons.drive_file_rename_outline)
              ),
              Flexible(
                flex: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                          child: 
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "رمز عبور را وارد کنید",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon:
                              IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: _toggle,
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                              )
                            ),
                            onSaved: (String value)
                            {
                              Password=value;
                            },
                            validator: (value) {
                              if (value.length<6) {
                                return "رمز عبور حداقل باید 6 حرف باشد";
                              }
                              return null;
                            },
                            obscureText: _obscureText,
                          ),
                        ),
                  ),
                ),
              Flexible(
                flex: 2,
                  child: forms('آدرس رستوران', false, true, false,Icons.location_on)
              ),
              Flexible(
                  flex: 2,
                  child: forms('شماره ی رستوران',false,false,true,Icons.phone)
              ),
              Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex:2,
                        child: Radio(
                          value: "fastfood",
                          groupValue: Category,
                          onChanged: (T){
                            setState(() {
                              Category =T;
                            });
                          },
                        ),
                      ),
                      Flexible(
                        flex: 1,
                          child: Text("فست فود")
                      ),
                      Flexible(
                        flex:2,
                        child: Radio(
                          value: "sonati",
                          groupValue: Category,
                          onChanged: (T){
                            setState(() {
                              Category =T;
                            });
                          },
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: Text("رستوران سنتی")
                      )
                    ],
                  )
              ),

              Flexible(
                flex: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: ElevatedButton(
                      onPressed:() {
                          setState(() {
                            if (_fromKey.currentState.validate()) {
                              setState(() {
                                _fromKey.currentState.save();
                                restaurant_info.res_add(Name, Password, Address, Number, Category,comment_list,report_list,menu);
                                Navigator.pop(context);
                              });
                            }
                          });
                      },
                      child: Text("ثبت نام"),
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
              ),
            ],
          ),
        )
      ),
    );
  }
}

