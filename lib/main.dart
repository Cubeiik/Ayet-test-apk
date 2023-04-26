import 'package:ayet_apk/custom_offerwall_show.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ayet test apk'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void runAyet(int platform, String id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewExample(
          platform: platform, //if platform = 1 - ios
          identifier: id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool iphone = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                final int platformId = iphone ? 1 : 0;

                runAyet(platformId, '124523452');
              },
              child: const Text('AyetStudios'))),
    );
  }
}
