class Vehicle {
  // instance variables
  String name;
  int maxCapacity, currentCapacity;

  // constructor
  Vehicle(this.name, this.currentCapacity, this.maxCapacity);

  // setters
  void setName(String newName) { name = newName; }
}