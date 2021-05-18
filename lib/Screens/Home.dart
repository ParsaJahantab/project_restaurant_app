import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var assetImage=new AssetImage('assets/logo.png');
    var image=new Image(image: assetImage,width: 50,height: 50,);
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 12, 110, 1),
        body:
          Column(
            children: [
              Flexible(
                  flex:8,
                  child: Container(
                      child:Image.asset('assets/images/logo.png')
                  )
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      child: Text("عضو شوید"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(16, 224, 24, 1)),
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          side:BorderSide(color: Colors.green),
                        )
                      )
                    )
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        child: Text("ورود"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(16, 224, 24, 1)),
                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                  side:BorderSide(color: Colors.green),
                                )
                            )
                        )
                    ),
                  ),
                ]
              ),
            ],
    ),
    );
  }
}
