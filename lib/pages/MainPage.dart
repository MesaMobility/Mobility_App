import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:mobility_appa/models/Vehicle.dart';
import 'package:mobility_appa/models/VehicleDisplay.dart';
import 'package:mobility_appa/pages/VehiclePage.dart';

class MainPage extends StatefulWidget { @override MainPageState createState() => MainPageState(); }

class MainPageState extends State<MainPage> {
  // instance variables
  List<Vehicle> vehicles, searchVehicles;
  List<VehicleDisplay> vehicleDisplays;
  Widget appBarTitle;
  TextEditingController searchController = TextEditingController();
  String searchText;
  Icon searchIcon;
  bool isKeyboardOpen, isSearching;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appBarTitle),
      //resizeToAvoidBottomInset: false,
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
                  height: 280.0,
                  color: Colors.black26,
                  child: buildList(),
                ),
              )

            ],
            overflow: Overflow.visible,
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(child: searchIcon, onPressed: () => switchSearch(!isSearching),),
    );
  }



  @override
  void initState() {
    super.initState();

    vehicles = [
      Vehicle("258", 10, 40), Vehicle("71", 5, 40), Vehicle("268", 5, 40), Vehicle("255", 5, 40),
    ];
    searchVehicles = List<Vehicle>();


    searchText = "";
    searchIcon = Icon(Icons.search);
    appBarTitle = Text("Mobility Demo");
    searchController = TextEditingController();
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        setState(() {
          searchVehicles.addAll(vehicles);
          searchText = "";
        });
        print("searchText empty");
      }
      else {
        setState(() {
          searchText = searchController.text;
        });
        print(searchText);
      }
    });

    vehicleDisplays = [];
    vehicles.forEach((vehicle) { vehicleDisplays = List.from(vehicleDisplays)..add(VehicleDisplay(vehicle: vehicle, key: UniqueKey())); });

    isSearching = false;
    isKeyboardOpen = false;
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) { isKeyboardOpen = isSearching = visible; switchSearch(isSearching); }
    );
  }

  void switchSearch(bool searching) {
    if (searching) {
      setState(() {
        isSearching = true;
        searchIcon = Icon(Icons.clear);
        appBarTitle = TextField(
          controller: searchController,
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(hintText: "Search..."),
        );
      });

    }
    else {
      setState(() {
        isSearching = false;
        searchIcon = Icon(Icons.search);
        searchController.clear();
        FocusScope.of(context).unfocus();
        appBarTitle = Text("Mobility Demo");
      });
    }
  }

  Widget buildList() {
    setState(() {
      searchVehicles.clear();
      vehicleDisplays = List.from(vehicleDisplays)..clear();

      searchVehicles.addAll(vehicles);
      vehicles.forEach((vehicle) { vehicleDisplays = List.from(vehicleDisplays)..add(VehicleDisplay(vehicle: vehicle, key: UniqueKey())); });
    });
    if (searchText.isNotEmpty) {
      for (Vehicle vehicle in vehicles) {
        if (!vehicle.name.contains(searchText)) {
          //int index = vehicles.indexOf(vehicle);
          setState(() {
            searchVehicles.remove(vehicle);
            vehicleDisplays.forEach((display) {
              if (display.state.vehicle == vehicle)
              vehicleDisplays = List.from(vehicleDisplays)..remove(display);
            });

          });
        }
      }
    }
    print(searchVehicles);
    vehicleDisplays.forEach((display) { print(display.state.vehicle); });
    return ListView.builder(
      shrinkWrap: true,
      itemCount: vehicleDisplays.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VehiclePage(vehicle: searchVehicles[index],))
          ),
          child: vehicleDisplays[index],
        );
      },
    );
  }

}