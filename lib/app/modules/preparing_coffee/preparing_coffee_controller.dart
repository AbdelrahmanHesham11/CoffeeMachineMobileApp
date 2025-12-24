import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';

class PreparingCoffeeController extends GetxController {
  // Define a BluetoothConnection variable
  BluetoothConnection? connection;

  // Define a connection status variable
  var connectionStatus = false.obs;

  // Function to update the connection status
  void updateConnectionStatus() {
    if (connection != null) {
      connectionStatus.value = connection!.isConnected;
    } else {
      connectionStatus.value = false;
    }
  }
}
