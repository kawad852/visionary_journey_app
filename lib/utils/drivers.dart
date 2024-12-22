import '../models/order/order_model.dart';
import 'enums.dart';

class MyDrivers {
  static List<Driver> drivers = [
    Driver(
      id: "R123",
      status: DriverStatus.available,
      nameEn: "Ahmad Al-Masri",
      nameAr: "أحمد المصري",
      photoURL: "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
      carDetails: CarDetails(
        nameEn: "Toyota Prius",
        nameAr: "تويوتا بريوس",
        color: "0000FF",
        plateNum: "ABC123",
        phoneNum: "+962234567890",
      ),
    ),
    Driver(
      id: "R456",
      status: DriverStatus.available,
      nameEn: "Khaled Al-Azzam",
      nameAr: "خالد العزام",
      photoURL: "https://img.freepik.com/free-photo/portrait-optimistic-businessman-formalwear_1262-3600.jpg",
      carDetails: CarDetails(
        nameEn: "Honda Civic",
        nameAr: "هوندا سيفيك",
        color: "FF0000",
        plateNum: "XYZ789",
        phoneNum: "+962987654321",
      ),
    ),
    Driver(
      id: "R789",
      status: DriverStatus.available,
      nameEn: "Omar Al-Tamimi",
      nameAr: "عمر التميمي",
      photoURL: "https://img.freepik.com/free-photo/happy-young-businessman-walking-near-business-center_171337-19784.jpg",
      carDetails: CarDetails(
        nameEn: "Ford Focus",
        nameAr: "فورد فوكس",
        color: "000000",
        plateNum: "LMN456",
        phoneNum: "+962122334455",
      ),
    ),
    Driver(
      id: "D123",
      status: DriverStatus.available,
      nameEn: "Yousef Al-Jabari",
      nameAr: "يوسف الجبري",
      photoURL:
          "https://static.vecteezy.com/system/resources/thumbnails/005/346/410/small_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg",
      carDetails: CarDetails(
        nameEn: "Toyota Corolla",
        nameAr: "تويوتا كورولا",
        color: "FFFFFF",
        plateNum: "ABC123",
        phoneNum: "+962987654321",
      ),
    ),
    Driver(
      id: "D456",
      status: DriverStatus.available,
      nameEn: "Hassan Al-Najjar",
      nameAr: "حسن النجار",
      photoURL: "https://thumbs.dreamstime.com/b/portrait-handsome-smiling-young-man-folded-arms-smiling-joyful-cheerful-men-crossed-hands-isolated-studio-shot-172869765.jpg",
      carDetails: CarDetails(
        nameEn: "Honda Civic",
        nameAr: "هوندا سيفيك",
        color: "FF5733",
        plateNum: "XYZ789",
        phoneNum: "+962123456789",
      ),
    ),
    Driver(
      id: "D789",
      status: DriverStatus.available,
      nameEn: "Tariq Al-Khateeb",
      nameAr: "طارق الخطيب",
      photoURL:
          "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yX3Bob3RvX29mX2FfYmxhY2tfYnVzaW5lc3NtYW5faXNvbGF0ZWRfb25fb2ZmX19lZmMxZDllNC1iNzQ5LTQ2NzMtYjRmMS1lYjI0NTBiYzNiOGRfMS5qcGc.jpg",
      carDetails: CarDetails(
        nameEn: "Chevrolet Malibu",
        nameAr: "شيفروليه ماليبو",
        color: "123456",
        plateNum: "QRS456",
        phoneNum: "+962998877665",
      ),
    ),
  ];
}
