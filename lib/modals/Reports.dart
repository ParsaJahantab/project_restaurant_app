import 'package:flutter/material.dart';
class Report{
  String code;
  double cost;
  String name;
  DateTime time;
  bool status;
  Report(String code,double cost,String name,DateTime time,bool status)
  {
    this.code=code;
    this.cost=cost;
    this.name=name;
    this.time=time;
    this.status=status;
  }
  void setName(){
    this.name=name;
  }
  String getCode()
  {
    return code;
  }
  double getCost()
  {
    return cost;
  }
  DateTime getTime()
  {
    return time;
  }
  void set_status()
  {
    status=!status;
  }
}
class Report_list{
  List<Report> report_list=List.empty(growable: true);
  Report_list()
  {
  }
  void Rep_add(String code,double cost,String name,DateTime time,bool status)
  {
    Report report=new Report(code, cost, name, time, status);
    report_list.add(report);
  }
  List<Report> getReports()
  {
    return report_list;
  }
  List<Report> getTodayReports()
  {
    List<Report> today_report_list=List.empty(growable: true);
    for(int i=0;i<report_list.length;i++)
      {
        if (report_list.elementAt(i).time.day==DateTime.now().day && report_list.elementAt(i).time.year==DateTime.now().year && report_list.elementAt(i).time.month==DateTime.now().month)
          {
            Report report=new Report(report_list.elementAt(i).code, report_list.elementAt(i).cost, report_list.elementAt(i).name, report_list.elementAt(i).time, report_list.elementAt(i).status);
            today_report_list.add(report);
          }
      }
    return today_report_list;
  }


}