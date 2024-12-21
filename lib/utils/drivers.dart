import '../models/order/order_model.dart';
import 'enums.dart';

class MyDrivers {
  static List<Driver> drivers = [
    Driver(
      id: "R123",
      status: DriverStatus.available,
      firstName: "Ahmad",
      lastName: "Al-Masri",
      photoURL: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
      carDetails: CarDetails(
        name: "Toyota Prius",
        color: "0000FF",
        plateNum: "ABC123",
        phoneNum: "+962234567890",
      ),
    ),
    Driver(
      id: "R456",
      status: DriverStatus.available,
      firstName: "Khaled",
      lastName: "Al-Azzam",
      photoURL: "https://img.freepik.com/free-photo/portrait-optimistic-businessman-formalwear_1262-3600.jpg",
      carDetails: CarDetails(
        name: "Honda Civic",
        color: "FF0000",
        plateNum: "XYZ789",
        phoneNum: "+962987654321",
      ),
    ),
    Driver(
      id: "R789",
      status: DriverStatus.available,
      firstName: "Omar",
      lastName: "Al-Tamimi",
      photoURL: "https://img.freepik.com/free-photo/happy-young-businessman-walking-near-business-center_171337-19784.jpg",
      carDetails: CarDetails(
        name: "Ford Focus",
        color: "000000",
        plateNum: "LMN456",
        phoneNum: "+962122334455",
      ),
    ),
    Driver(
      id: "D123",
      status: DriverStatus.available,
      firstName: "Yousef",
      lastName: "Al-Jabari",
      photoURL:
          "https://static.vecteezy.com/system/resources/thumbnails/005/346/410/small_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg",
      carDetails: CarDetails(
        name: "Toyota Corolla",
        color: "FFFFFF",
        plateNum: "ABC123",
        phoneNum: "+962987654321",
      ),
    ),
    Driver(
      id: "D456",
      status: DriverStatus.available,
      firstName: "Hassan",
      lastName: "Al-Najjar",
      photoURL: "https://thumbs.dreamstime.com/b/portrait-handsome-smiling-young-man-folded-arms-smiling-joyful-cheerful-men-crossed-hands-isolated-studio-shot-172869765.jpg",
      carDetails: CarDetails(
        name: "Honda Civic",
        color: "FF5733",
        plateNum: "XYZ789",
        phoneNum: "+962123456789",
      ),
    ),
    Driver(
      id: "D789",
      status: DriverStatus.available,
      firstName: "Tariq",
      lastName: "Al-Khateeb",
      photoURL:
          "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yX3Bob3RvX29mX2FfYmxhY2tfYnVzaW5lc3NtYW5faXNvbGF0ZWRfb25fb2ZmX19lZmMxZDllNC1iNzQ5LTQ2NzMtYjRmMS1lYjI0NTBiYzNiOGRfMS5qcGc.jpg",
      carDetails: CarDetails(
        name: "Chevrolet Malibu",
        color: "123456",
        plateNum: "QRS456",
        phoneNum: "+962998877665",
      ),
    ),
  ];
}
