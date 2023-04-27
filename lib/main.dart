import 'package:ayet_apk/custom_offerwall_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

  final Uri toLaunch = Uri(
    scheme: 'https',
    host: 'www.ayetstudios.com',
    path: 'offers/web_offerwall/12563?external_identifier=1234',
  );

  void _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool iphone = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                final int platformId = iphone ? 1 : 0;
                runAyet(platformId, '1234');
              },
              child: const Text('AyetStudios WEBVIEW'),
            ),
            ElevatedButton(
              onPressed: () async => _launchInBrowser(toLaunch),
              child: const Text('AyetStudios BROWSER'),
            ),
          ],
        ),
      ),
    );
  }
}
