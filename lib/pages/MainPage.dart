import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobility_appa/models/Vehicle.dart';
import 'package:mobility_appa/models/VehicleDisplay.dart';
import 'package:mobility_appa/pages/VehiclePage.dart';

class MainPage extends StatefulWidget { @override MainPageState createState() => MainPageState(); }

class MainPageState extends State<MainPage> {
  // instance variables
  List<Vehicle> vehicles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mobility Demo')),
      body: Container(
        child: SafeArea(
          child: Stack(
            //fit: StackFit.expand,
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[

              // to allow children to align at the very bottom center
              Container(),

              // maps (currently just a screenshot as placeholder)
              Image.asset('assets/images/map_placeholder.png'),

              // vehicle route list
              Positioned(
                child: Container(
                  height: 300.0,
                  color: Colors.black26,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: vehicles.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VehiclePage(vehicle: vehicles[index],))
                        ),
                        child: VehicleDisplay(vehicle: vehicles[index],),
                      );
                    },
                  ),
                ),
              )

            ],
            overflow: Overflow.visible,
          )
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    vehicles = [
      Vehicle("258", 10, 40), Vehicle("71", 5, 40), Vehicle("71", 5, 40), Vehicle("71", 5, 40),
    ];


  }
}