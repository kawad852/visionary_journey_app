import '../models/order/order_model.dart';
import 'enums.dart';

class MyDrivers {
  static List<Driver> drivers = [
    Driver(
      id: "R123",
      status: DriverStatus.available,
      firstName: "John",
      lastName: "Doe",
      photoURL: "https://example.com/johndoe.jpg",
      carDetails: CarDetails(
        name: "Toyota Prius",
        color: "Blue",
        plateNum: "ABC123",
        phoneNum: "+1234567890",
      ),
    ),
    Driver(
      id: "R456",
      status: DriverStatus.available,
      firstName: "Alice",
      lastName: "Smith",
      photoURL: "https://example.com/alicesmith.jpg",
      carDetails: CarDetails(
        name: "Honda Civic",
        color: "Red",
        plateNum: "XYZ789",
        phoneNum: "+0987654321",
      ),
    ),
    Driver(
      id: "R789",
      status: DriverStatus.available,
      firstName: "Bob",
      lastName: "Johnson",
      photoURL: "https://example.com/bobjohnson.jpg",
      carDetails: CarDetails(
        name: "Ford Focus",
        color: "Black",
        plateNum: "LMN456",
        phoneNum: "+1122334455",
      ),
    ),
  ];
}
