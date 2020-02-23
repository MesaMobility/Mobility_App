import 'package:flutter/material.dart';
import 'package:mobility_appa/models/Vehicle.dart';
import 'package:mobility_appa/models/VehicleDisplay.dart';

class MainPage extends StatefulWidget { @override MainPageState createState() => MainPageState(); }

class MainPageState extends State<MainPage> {
  // instance variables
  List<Vehicle> vehicles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Center(
            child: Container(

              child: ListView.builder(
                shrinkWrap: true,
                itemCount: vehicles.length,
                itemBuilder: (context, index) {
                  return VehicleDisplay(vehicle: vehicles[index],);
                },
              ),
            ),

          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    vehicles = [
      Vehicle("258", 10, 40), Vehicle("71", 5, 40),
    ];


  }
}