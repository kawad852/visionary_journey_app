import '../models/order/order_model.dart';
import 'enums.dart';

class MyDrivers {
  static List<Driver> drivers = [
    Driver(
      id: "R123",
      status: DriverStatus.available,
      firstName: "John",
      lastName: "Doe",
      photoURL: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
      carDetails: CarDetails(
        name: "Toyota Prius",
        color: "0000FF",
        plateNum: "ABC123",
        phoneNum: "+1234567890",
      ),
    ),
    Driver(
      id: "R456",
      status: DriverStatus.available,
      firstName: "Alice",
      lastName: "Smith",
      photoURL: "https://img.freepik.com/free-photo/portrait-optimistic-businessman-formalwear_1262-3600.jpg",
      carDetails: CarDetails(
        name: "Honda Civic",
        color: "FF0000",
        plateNum: "XYZ789",
        phoneNum: "+0987654321",
      ),
    ),
    Driver(
      id: "R789",
      status: DriverStatus.available,
      firstName: "Bob",
      lastName: "Johnson",
      photoURL: "https://img.freepik.com/free-photo/happy-young-businessman-walking-near-business-center_171337-19784.jpg",
      carDetails: CarDetails(
        name: "Ford Focus",
        color: "000000",
        plateNum: "LMN456",
        phoneNum: "+1122334455",
      ),
    ),
  ];
}
