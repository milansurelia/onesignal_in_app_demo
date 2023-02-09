import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OneSignal In-App Message Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    OneSignal.shared.setAppId("oneSignalAppId");
    setInAppMessageClickedHandler();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
      ),
      body: const Center(
        child: Text('OneSignal In-App Messaging Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          OneSignal.shared.addTrigger('show-in-app', 'true');
        },
        tooltip: 'Show In-App',
        child: const Icon(Icons.remove_red_eye_rounded),
      ),
    );
  }

  void setInAppMessageClickedHandler() {
    OneSignal.shared
        .setInAppMessageClickedHandler((OSInAppMessageAction action) {
      print('OneSignal: IAM clicked action: ${action.clickName}');
      // Perform Action based on the event.
    });
  }
}
