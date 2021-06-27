import 'package:flutter/material.dart';
import 'package:restaurant/Screens/Today_Report_Screen.dart';
import 'package:restaurant/modals/res_info.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
class Map_Screen extends StatefulWidget {
  final String Number;
  final int res_index;
  const Map_Screen(this.Number,this.res_index);
  @override
  _Map_ScreenState createState() => _Map_ScreenState();
}

class _Map_ScreenState extends State<Map_Screen> {
  double radius = 100;
  var _fromKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<String> adress=restaurant_info.getRestaurants().elementAt(widget.res_index).Address.split(' ');
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: new LatLng(double.parse(adress.elementAt(0)), double.parse(adress.elementAt(1))),
          zoom: 13.0,
          minZoom: 10,
          maxZoom: 100,
          pinchZoomWinGestures: 100,
          pinchZoomThreshold: 100,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(double.parse(adress.elementAt(0)), double.parse(adress.elementAt(1))),
                //point: LatLng(51.5, -0.09),
                builder: (ctx) =>
                    Container(
                      child: Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 20,
                      ),
                    ),
              ),
            ],
          ),
          CircleLayerOptions(
              circles: [
                new CircleMarker(
                    point: LatLng(double.parse(adress.elementAt(0)), double.parse(adress.elementAt(1))),
                    //point: LatLng(51.5,-0.09),
                    color: Colors.blue.withOpacity(0.3),
                    borderStrokeWidth: 3.0,
                    borderColor: Colors.blue,
                    radius: radius //radiu
                )
              ]
          )
        ],
      ),
      floatingActionButton:new FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: ()
          {
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
                                  labelText: "شعاع فرستادن غذا را مشخص کنید",
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
                                radius=double.parse(value);
                              },
                              validator: (value) {
                                if (value==null || value.isEmpty) {
                                  return "شعاع";
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
                                        print(radius);
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
          }
      ),
    );
  }
}