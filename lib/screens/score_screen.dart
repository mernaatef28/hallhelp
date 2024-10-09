import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  Future<void> _launchInAppWebView(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView, // Open within the app in a web view
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch = Uri(
      scheme: 'https',
      host: 'nasa-space-apps-leaderboard-lilac.vercel.app',
      path: '/',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Board'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _launchInAppWebView(toLaunch), // Launch the URL
          child: const Text('Open NASA Space Apps Leaderboard'),
        ),
      ),
    );
  }
}
