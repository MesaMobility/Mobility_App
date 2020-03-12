import 'package:flutter/material.dart';
import 'package:mobility_appa/models/Vehicle.dart';

class VehiclePage extends StatefulWidget {
  // state
  VehiclePageState state;

  // constructor
  VehiclePage({Vehicle vehicle, Key key}) : super(key: key) { state = VehiclePageState(vehicle); }
  @override VehiclePageState createState() => state;


}

class VehiclePageState extends State<VehiclePage> {
  // instance variables
  Vehicle vehicle;

  // constructor
  VehiclePageState(this.vehicle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(vehicle.name, style: TextStyle(fontSize: 50),),

                Row(
                  children: <Widget>[ Icon(Icons.person_pin), Text(vehicle.currentCapacity.toString()) ],
                ),

                Row(
                  children: <Widget>[ Icon(Icons.person), Text(vehicle.maxCapacity.toString()) ],
                )

              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(child: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context),),

    );
  }
}