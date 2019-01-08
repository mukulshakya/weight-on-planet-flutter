import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /*
  * pluto: 0.06
  * mars: 0.38
  * venus: 0.91
  */

  TextEditingController _textController = new TextEditingController();
  int radioValue = 0;
  double _result = 0;
  String _formattedResult = "";

  void radioHandler(int value) {
    setState(() {
      radioValue = value;
      switch(radioValue) {
        case 0:
          _result = calculateWeight(_textController.text,0.06);
          _formattedResult = "Your Weight On Pluto is ${_result.toStringAsFixed(1)} KG";
          break;
        case 1:
          _result = calculateWeight(_textController.text,0.38);
          _formattedResult = "Your Weight On Mars is ${_result.toStringAsFixed(1)} KG";
          break;
        case 2:
          _result = calculateWeight(_textController.text,0.91);
          _formattedResult = "Your Weight On Venus is ${_result.toStringAsFixed(1)} KG";
          break;
      }
    });
  }

  double calculateWeight(String text, double d) {
    if(text.isNotEmpty && int.parse(text)>0) {
      return int.parse(text)*d;
    }
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: new AppBar(
        title: new Text("Weight on Planet"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          children: <Widget>[
            new Image.asset(
              "images/planet.png",
              width: 150.0,
            ),
            new Container(
              margin: new EdgeInsets.only(left: 10.0, right: 10.0),
              child: new TextField(
                controller: _textController,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                    hintText: "in KG",
                    labelText: "Your Weight on Earth",
                    icon: new Icon(Icons.person_outline)),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Radio(
                  value: 0,
                  groupValue: radioValue,
                  onChanged: radioHandler,
                  activeColor: Colors.brown,
                ),
                new Text("Pluto", style: new TextStyle(color: Colors.white)),
                new Radio(
                  value: 1,
                  groupValue: radioValue,
                  onChanged: radioHandler,
                  activeColor: Colors.red,
                ),
                new Text("Mars", style: new TextStyle(color: Colors.white)),
                new Radio(
                  value: 2,
                  groupValue: radioValue,
                  onChanged: radioHandler,
                  activeColor: Colors.yellow,
                ),
                new Text("Venus", style: new TextStyle(color: Colors.white)),
              ],
            ),
            new Padding(padding: EdgeInsets.only(top: 15.0)),
            new Text(
              _textController.text.isEmpty ? "Please Enter Weight in KG" : "$_formattedResult",
              style: new TextStyle(color: Colors.white, fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }


}
