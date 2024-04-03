import 'dart:io';
// Define an interface with a method
abstract class Car {
  void startEngine();
}
// create a class that implements this interface
class Lorry implements Car{
  @override
  void startEngine(){
    print('Vroooum!!!');
  }
}

// Create a class that overrides an inherited method
class Truck extends Lorry {
  @override
  void startEngine() {
    print('Roooaaaam!!!');
  }
}

 // Creates a class that represents a Car instance initialized with data from a file
class CarFromTxtFile implements Car {
  String engineStatus;

  CarFromTxtFile({required this.engineStatus});

  @override
  void startEngine() {
    print('Engine status: $engineStatus');
  }

  // Method to read data from file and initialize the instance
  static Future<CarFromTxtFile> readFromFile(String filePath) async {
    try {
      // Read data from file
      var file = File(filePath);
      var engineStatus = await file.readAsString();

      // Initialize CarFromFile instance with data from file
      return CarFromTxtFile(engineStatus: engineStatus);
    } catch (e) {
      // Handle any errors
      print('Error reading file: $e');
      // Return a default instance if reading fails
      return CarFromTxtFile(engineStatus: 'Unknown');
    }
  }
}

void main() async {
  // Read data from file and initialize CarFromFile instance
  var carFromFile = await CarFromTxtFile.readFromFile('vehicle_data.txt');

  // Call startEngine method to demonstrate the functionality
  carFromFile.startEngine(); // Output vehicle_data.txt data read from file

  // Create an instance of a class that overrides an inherited method
  var lorry = Lorry();
  lorry.startEngine(); 

  // Method that demonstrates the use of a loop --for loop
  for (var i = 0; i < 5; i++) {
    print('Audi RS4- : $i');
  }
}