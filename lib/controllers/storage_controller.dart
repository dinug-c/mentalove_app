import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  final storage = GetStorage();

  void saveData(String key, dynamic value) {
    storage.write(key, value);
  }

  dynamic getData(String key) {
    return storage.read(key);
  }
}

// Terapis terapis = Terapis(
//   id: "a",
//   email: "",
//   harga: 0,
//   keahlian: [],
//   nama: "",
//   lamaPengalaman: "",
//   password: "",
//   rating: 0,
// );

// Future fetchData() async {
//   Map<String, dynamic> data =
//       await readData('64eddfc1b89ed14ca51f', '64eddca5a7aca6abc1f9');
//   terapis = Terapis(
//     id: "a",
//     email: data['email'],
//     harga: data['harga'],
//     keahlian: data['keahlian'],
//     nama: data['nama'],
//     lamaPengalaman: data['lama_pengalaman'],
//     password: data['password'],
//     rating: data['rating'],
//   );
// }
