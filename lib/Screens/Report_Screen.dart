
import 'package:flutter/material.dart';
import 'package:restaurant/Screens/Today_Report_Screen.dart';
import 'package:restaurant/modals/res_info.dart';
class Report_Screen extends StatefulWidget {
  final String Number;
  final int res_index;
  const Report_Screen(this.Number,this.res_index);
  @override
  _Report_ScreenState createState() => _Report_ScreenState();
}

class _Report_ScreenState extends State<Report_Screen> {
  var _fromKey2=GlobalKey<FormState>();
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
        title: Text("گزارش ها"),
      ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width*0.50,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(00.0))),
                          ),
                          onPressed: (){},
                          child: Text('همه ی گزارش ها'),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width*0.50,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(00.0))),
                          ),

                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Today_Report_Screen(widget.Number, widget.res_index,change)));
                          },
                          child: Text('گزارش های امروز'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getReports().length,
                  itemBuilder: (BuildContext context,int index)
                  {
                    return Container(
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.bookmark_border),
                                title: Text(restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getReports().elementAt(index).name),
                                subtitle: Text(
                                 '#'+restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getReports().elementAt(index).code+'\n'+
                                  'cost:'+   restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getReports().elementAt(index).cost.toString()+'\n'+
                                     restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getReports().elementAt(index).time.toString()+'\n',
                                  maxLines: 5,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text("status of order:"),
                                  Switch(
                                      value:  restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getReports().elementAt(index).status,
                                      onChanged: (value){
                                        setState(() {
                                          restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getReports().elementAt(index).set_status();
                                        });
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
            )
         ],
        )

    );
  }
}
