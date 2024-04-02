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