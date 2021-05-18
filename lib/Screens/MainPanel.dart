import 'package:flutter/material.dart';
import 'package:restaurant/Screens/Comment_Screen.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Screens/Home.dart';
import 'package:restaurant/Screens/Login.dart';
import 'package:restaurant/Screens/Menu_Screen.dart';
import 'package:restaurant/Screens/Report_Screen.dart';
import 'package:restaurant/Screens/register.dart';
import 'package:restaurant/Screens/MainPanel.dart';
import 'package:restaurant/modals/Comments.dart';
import 'package:restaurant/modals/Reports.dart';
import 'package:restaurant/modals/res_info.dart';
class MainPanel extends StatelessWidget {
   Widget buttons(BuildContext context,String title)
  {
    //print(context);
    return
    InkWell(
      child: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2),
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
              title,
              style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      onTap: () {
        if (title=='Comments') {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Comment_Screen(Number, res_index)));
        }
        else if (title=='Reports')
          {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Report_Screen(Number, res_index)));
          }
        else if (title=='Menu')
          {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Menu_Screen(Number, res_index)));
          }
      },
    );
  }
  final String Number;
  final int res_index;
  DateTime time=DateTime.now();
  MainPanel(this.Number,this.res_index);
  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(237, 12, 110, 1),
      body: Column(
        children: [
        Flexible(
        flex:5,
        child: Image.asset('assets/images/logo.png'),
      ),
        Flexible(
          flex: 1,
          child: Row(
            children: [
              buttons(context, "Comments"),
              buttons(context, "Reports")
            ]
          ),
        ),
          Flexible(flex:1,child: Container()),
          Flexible(
            flex: 1,
            child: Row(
                children: [
                  buttons(context, "Menu"),
                  //buttons(context, "Reports")
                ]
            ),
          ),
          Flexible(flex:2,child: Container()),
        ]
    )
    );
  }
}
//onTap:()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => Comment_Screen(Number,res_index))),
