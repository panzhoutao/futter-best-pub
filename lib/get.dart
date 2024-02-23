import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @author : mr.pan
/// @createTime : 2022/9/27 11:18
/// @describe :
class GetApp extends StatelessWidget {
  const GetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage( name: '/', page: () => const TestGetPage()),
        GetPage(name: '/APage', page: () => const APage()),
      ],
    );
  }
}

class TestGetPage extends StatefulWidget {
  const TestGetPage({Key? key}) : super(key: key);

  @override
  State<TestGetPage> createState() => _TestGetPageState();
}

class _TestGetPageState extends State<TestGetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('main1')),
      body: Wrap(
        spacing: 10,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(() => APage());
            },
            child: Text('打开a页面'),
          ),
        ],
      ),
    );
  }
}

class APage extends StatefulWidget {
  const APage({Key? key}) : super(key: key);

  @override
  State<APage> createState() => _APageState();
}

class _APageState extends State<APage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('APage')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.removeRoute(ModalRoute.of(context)!);
            },
            child: Text('关闭自己'),
          ),
        ],
      ),
    );
  }
}

class BPage extends StatefulWidget {
  const BPage({Key? key}) : super(key: key);

  @override
  State<BPage> createState() => _BPageState();
}

class _BPageState extends State<BPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BPage')),
    );
  }
}
