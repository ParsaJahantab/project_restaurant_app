import 'package:flutter/material.dart';
import 'package:restaurant/modals/res_info.dart';
import 'package:restaurant/Screens/MainPanel.dart';
class Login_Screen extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login_Screen> {
  var _fromKey=GlobalKey<FormState>();
  String Number;
  int index;
  String Password;
  String Number1;
  String Password1;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 12, 110, 1),
      body: Container(
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                Flexible(
                    flex: 10,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
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
                          Password1=value;
                          if (value==null || value.isEmpty) {
                            return "رمز عبور نمیتواند خالی باشد";
                          }
                          return null;
                        },
                        obscureText: _obscureText,
                      ),
                    ),
                  ),
                ),
                Flexible(
                    flex: 1,
                    child: Container()
                ),
                Flexible(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Center(
                        child:
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "شماره ی رستوران را وارد کنید",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              prefixIcon: Icon(Icons.phone),
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
                              Number1=value;
                              if (value==null || value.isEmpty) {
                                return "شماره نمیتواند خالی باشد";
                              }
                                if (!(restaurant_info.login_confirm(Number1, Password1)))
                              {
                                    return "رمز عبور یا شماره اشتباه است";
                              }
                              return null;
                            }
                        ),
                      ),
                    ),
                ),
                Flexible(
                    flex: 2,
                    child: Container(
                    )
                ),

                Flexible(
                  flex: 3,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Center(
                      child: ElevatedButton(
                          onPressed:() {
                            setState(() {
                              if (_fromKey.currentState.validate()) {
                                setState(() {
                                  _fromKey.currentState.save();
                                  print("correct");
                                  for(int i=0;i<restaurant_info.getRestaurants().length;i++)
                                    {
                                      if (restaurant_info.getRestaurants().elementAt(i).Number==Number1)
                                        {
                                          index=i;
                                          break;
                                        }
                                    }
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPanel(Number1,index)));
                                });
                              }
                            });
                          },
                          child: Text("ورود"),
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

