import 'package:flutter/material.dart';
import 'package:restaurant/Screens/Home.dart';
import 'package:restaurant/Screens/Login.dart';
import 'package:restaurant/Screens/register.dart';
import 'package:restaurant/Screens/MainPanel.dart';
import 'package:restaurant/modals/Comments.dart';
import 'package:restaurant/modals/res_info.dart';
class Comment_Screen extends StatefulWidget {
  final String Number;
  final int res_index;
  const Comment_Screen(this.Number,this.res_index);
  @override
  _Comment_ScreenState createState() => _Comment_ScreenState();
}

class _Comment_ScreenState extends State<Comment_Screen> {
  var _fromKey1=GlobalKey<FormState>();
  String Answer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نظرات'),
      ),
      body: new ListView.builder(
        itemCount: restaurant_info.getRestaurants().elementAt(widget.res_index).comment_list.getComments().length,
        itemBuilder: (BuildContext context,int index){
          return Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                   ListTile(
                    leading: Icon(Icons.person),
                    title: Text(restaurant_info.getRestaurants().elementAt(widget.res_index).comment_list.getComments().elementAt(index).author),
                    subtitle: Text(
                        restaurant_info.getRestaurants().elementAt(widget.res_index).comment_list.getComments().elementAt(index).comment,
                      maxLines: 5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(restaurant_info.getRestaurants().elementAt(widget.res_index).comment_list.getComments().elementAt(index).score.toString()+"/10"),
                      Icon(Icons.star,color: Colors.yellow,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          restaurant_info.getRestaurants().elementAt(widget.res_index).comment_list.getComments().elementAt(index).answer,
                        maxLines: 5,
                      ),
                      IconButton(
                          icon: Icon(Icons.drive_file_rename_outline),
                          onPressed: ()
                          {
                            showModalBottomSheet(context: context,
                                builder: (context) =>Column(
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Container(),
                                    ),
                                    Flexible(
                                      flex:1,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        child: Form(
                                          key: _fromKey1,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  labelText: "پاسخ خود را وارد کنید",
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.transparent),
                                                      borderRadius: BorderRadius.all(Radius.circular(30))
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
                                                Answer=value;
                                              },
                                              validator: (value) {
                                                if (value==null || value.isEmpty) {
                                                  return "پاسخ نمیتواند خالی باشد";
                                                }
                                                return null;
                                              },
                                            ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 3,
                                      child: Container(),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        child: Center(
                                          child: ElevatedButton(
                                              onPressed:() {
                                                setState(() {
                                                  if (_fromKey1.currentState.validate()) {
                                                    setState(() {
                                                      _fromKey1.currentState.save();
                                                      restaurant_info.getRestaurants().elementAt(widget.res_index).comment_list.getComments().elementAt(index).setAnswer(Answer);
                                                      Navigator.pop(context);
                                                    });
                                                  }
                                                });
                                              },
                                              child: Text("ثبت"),
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
                                )
                            );
                          }
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        ),
      );
  }
}
