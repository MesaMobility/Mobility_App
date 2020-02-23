import 'package:flutter/material.dart';
import 'package:mobility_appa/models/Vehicle.dart';

class VehicleDisplay extends StatefulWidget {
  // state of RouteDisplay
  VehicleDisplayState state;

  // constructor
  VehicleDisplay({Vehicle vehicle, Key key}) : super(key: key) { state = VehicleDisplayState(vehicle); }
  @override VehicleDisplayState createState() => state;


}

class VehicleDisplayState extends State<VehicleDisplay> {
  // instance variables
  Vehicle _vehicle;

  // constructor
  VehicleDisplayState(this._vehicle);

  // build
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(5.0),
      child: Card(
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Text(_vehicle.name, style: TextStyle(fontSize: 50),),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Row(
                  children: <Widget>[ Icon(Icons.person_pin), Text(_vehicle.currentCapacity.toString()) ],
                ),

                Row(
                  children: <Widget>[ Icon(Icons.person, color: Colors.grey,), Text(_vehicle.maxCapacity.toString(), style: TextStyle(color: Colors.grey),) ],
                )

              ],
            ),
            Spacer(flex: 10,)


          ],
        ),
      ),
    );
  }
}