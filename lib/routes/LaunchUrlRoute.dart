import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class LaunchUrlRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LaunchUrlWidget(),
    );
  }
}

class LaunchUrlWidget extends StatelessWidget {

  const LaunchUrlWidget({Key? key}) : super(key: key);

  _launchURL() {
    // launch('https://flutter.dev');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: const Text('Show Flutter homepage'),
        ),
      ),
    );
  }

}
