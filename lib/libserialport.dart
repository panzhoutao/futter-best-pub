import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

class LibSerialPortPage extends StatefulWidget {
  const LibSerialPortPage({super.key});

  @override
  State<LibSerialPortPage> createState() => _LibSerialPortPageState();
}

class _LibSerialPortPageState extends State<LibSerialPortPage> {
  // 串口测试
  void serialTest() {
    print('Available ports:');
    var i = 0;
    List<String> list = SerialPort.availablePorts;
    print('PortSize: ${list.length}');
    for (final name in SerialPort.availablePorts) {
      final sp = SerialPort(name);
      print('${++i}) $name');
      print('\tDescription: ${sp.description}');
      print('\tManufacturer: ${sp.manufacturer}');
      print('\tSerial Number: ${sp.serialNumber}');
      print('\tProduct ID: 0x${sp.productId?.toRadixString(16)}');
      print('\tVendor ID: 0x${sp.vendorId?.toRadixString(16)}');
      sp.dispose();
    }
  }

  void _readData() {
    String name = 'COM5';
    final port = SerialPort(name);
    // port.config.baudRate = 115200;
    if (!port.openReadWrite()) {
      print(SerialPort.lastError);
      return;
    }

    // 读数据
    final reader = SerialPortReader(port);
    reader.stream.listen((data) {
      print('received: $data');
      print('receivedString: ${utf8.decode(data)}'); // 转换为字符串
      String hexString =
          data.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
      print('receivedHex: ${hexString.toUpperCase()}'); // 转换为16进制
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('串口通信')),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                serialTest();
              },
              child: Text('串口测试'),
            ),
            TextButton(
              onPressed: () {
                _readData();
              },
              child: Text('读数据'),
            ),
          ],
        ),
      ),
    );
  }
}
