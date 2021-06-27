
import 'package:flutter/material.dart';
import 'package:restaurant/modals/res_info.dart';

import 'Report_Screen.dart';
class Today_Report_Screen extends StatefulWidget {
  final String Number;
  final int res_index;
  Function change;
  Today_Report_Screen(this.Number,this.res_index,this.change);
  @override
  _Today_Report_ScreenState createState() => _Today_Report_ScreenState();
}

class _Today_Report_ScreenState extends State<Today_Report_Screen> {
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

                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(00.0))),
                          ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Report_Screen(widget.Number, widget.res_index)));
                          },
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
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(00.0))),
                          ),

                          onPressed: (){},
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
                    if (restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getReports().elementAt(index).time.day==DateTime.now().day && restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getReports().elementAt(index).time.year==DateTime.now().year && restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getReports().elementAt(index).time.month==DateTime.now().month)
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
                                            widget.change("name");
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

                    else
                      {
                        return Container();
                      }
                  }

              ),
            )
          ],
        )
    );
  }
}
/*Container(
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.bookmark_border),
                              title: Text(restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getTodayReports().elementAt(index).name),
                              subtitle: Text(
                                '#'+restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getTodayReports().elementAt(index).code+'\n'+
                                    'cost:'+   restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getTodayReports().elementAt(index).cost.toString()+'\n'+
                                    restaurant_info.getRestaurants().elementAt(widget.res_index).report_list.getTodayReports().elementAt(index).time.toString()+'\n',
                                maxLines: 5,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("status of order:"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );*/