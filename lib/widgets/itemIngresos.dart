import 'package:flutter/material.dart';

class ItemIngresos extends StatefulWidget {
  String title;
  double factor;
  int value;
  int total = 0;

  ItemIngresos({this.title, this.factor, this.value});

  @override
  _ItemIngresosState createState() => _ItemIngresosState();
}

class _ItemIngresosState extends State<ItemIngresos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Container(
            height: 30.0,
            width: 280.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.yellow[50], Colors.yellow[200]]),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              border: Border.all(
                color: Colors.yellow[800],
                width: 2.0,
              ),
            ),
            child: Center(
              child: Text(
                '${widget.title}'.toUpperCase(),
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
          ),
          Container(
            height: 70.0,
            width: 350.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.yellow[200], Colors.yellow[600]]),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.yellow[800],
                width: 2.0,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100.0,
                  height: 50.0,
                  child: TextField(
                    style: TextStyle(fontSize: 30.0),
                    textAlignVertical: TextAlignVertical.top,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        
                      });
                    },
                  ),
                ),
                Text('${widget.factor}'),
                Text("=", style: TextStyle(fontSize: 50.0)),
                Text(widget.total.toString(), style: TextStyle(fontSize: 50.0))
              ],
            ),
          )
        ],
      ),
    );
  }
}
